# frozen_string_literal: true

require_relative "lib/everylog_ruby_client/version"

Gem::Specification.new do |spec|
  spec.name = "everylog_ruby_client"

  spec.version = EveryLogRubyClient::VERSION

  spec.homepage = "https://github.com/everylogsaas/everylog_ruby_client"

  spec.summary = "A Ruby client library for Everylog API"

  spec.description = <<-EOS
    A simple Ruby with no external dependencies, to easily integrate with Everylog API
  EOS

  spec.license = "MIT"

  spec.authors = [
    "Gilberto Maccacaro"
  ]

  spec.email = ["gilberto.maccacaro@devinterface.com"]

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://www.rubydoc.info/gems/everylog_ruby_client/#{spec.version}",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "#{spec.homepage}/tree/v#{spec.version}"
  }

  spec.files         = Dir["CHANGELOG.md", "LICENSE", "README.md", "lib/**/*"]
  spec.bindir        = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.required_ruby_version = '>= 2.5'
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end