# frozen_string_literal: true

require "uri"
require "net/http"
require "oga"

require_relative "erogamescape/version"
require_relative "erogamescape/errors"

module Erogamescape
  def self.parse_response_html(html)
    doc = Oga.parse_html(html)
    title = doc.at_css("#query_result_header h3")&.text
    if doc.at_css("#queryplan_main").nil?
      text = doc.at_css("#query_result_main")&.text
      raise WrongSqlError.new(text) if title == "エラー(SQL間違い)"
      raise SqlError.new(text)
    end

    if doc.at_css("#query_result_main table").nil?
      text = doc.at_css("#query_result_main")&.text
      raise RuntimeSqlError.new(text)
    end

    columns = doc.css("#query_result_main th").map(&:text)
    doc.css("#query_result_main tr").map do |row|
      row_data = row.css("td").map(&:text)
      row_data.size == 0 ? nil : columns.zip(row_data).to_h
    end.compact
  end

  def self.post_sql(sql)
    uri = URI.parse("https://erogamescape.dyndns.org/~ap2/ero/toukei_kaiseki/sql_for_erogamer_form.php")
    body = URI.encode_www_form({ "sql" => sql })
    response = Net::HTTP.post(uri, body, { "Content-Type" => "application/x-www-form-urlencoded" })
    response.value
    response.body.force_encoding("UTF-8")
  end

  def self.query(sql)
    self.parse_response_html(self.post_sql(sql))
  end
end
