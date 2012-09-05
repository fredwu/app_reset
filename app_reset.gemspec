$:.push File.expand_path("../lib", __FILE__)

require "app_reset/version"

Gem::Specification.new do |s|
  s.name        = "app_reset"
  s.version     = AppReset::VERSION
  s.authors     = ["Fred Wu"]
  s.email       = ["ifredwu@gmail.com"]
  s.homepage    = "https://github.com/fredwu/app_reset"
  s.summary     = "Resets (and if available, seeds) your development and test databases."
  s.description = s.summary

  s.files       = `git ls-files`.split($\)
  s.test_files  = Dir['spec/**/*']

  s.add_dependency "rails"
end
