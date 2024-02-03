# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

task default: :test

namespace :rbs do
  task :generate_rbs_for_tests do
    Dir.chdir(__dir__)
    files = Dir.glob("test/**/*.rb")
    puts "rbs prototype rb #{files.join(" ")}"
    gen = `rbs prototype rb #{files.join(" ")}`
    outfile = File.expand_path("./sig-test/generated.rbs", __dir__)
    File.write(outfile, gen)

    rbs_files = Dir.glob("sig-test/*.rbs").reject { File.basename(_1) == "generated.rbs" }
    sh("rbs", "subtract", "--write", "sig-test/generated.rbs", *rbs_files) if !rbs_files.empty?
  end
end
