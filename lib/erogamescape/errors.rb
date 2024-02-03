# frozen_string_literal: true
module Erogamescape
  class SqlError < StandardError
  end

  class WrongSqlError < StandardError
  end

  class RuntimeSqlError < StandardError
  end
end
