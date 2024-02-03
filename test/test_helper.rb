# frozen_string_literal: true

parent_dir = __dir__
raise if parent_dir.nil?

$LOAD_PATH.unshift File.expand_path("../lib", parent_dir)
require "erogamescape"

require "minitest/autorun"
