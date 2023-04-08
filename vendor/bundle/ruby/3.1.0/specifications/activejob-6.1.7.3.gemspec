# -*- encoding: utf-8 -*-
# stub: activejob 6.1.7.3 ruby lib

Gem::Specification.new do |s|
  s.name = "activejob".freeze
  s.version = "6.1.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rails/rails/issues", "changelog_uri" => "https://github.com/rails/rails/blob/v6.1.7.3/activejob/CHANGELOG.md", "documentation_uri" => "https://api.rubyonrails.org/v6.1.7.3/", "mailing_list_uri" => "https://discuss.rubyonrails.org/c/rubyonrails-talk", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/rails/rails/tree/v6.1.7.3/activejob" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.date = "2023-03-13"
  s.description = "Declare job classes that can be run by a variety of queuing backends.".freeze
  s.email = "david@loudthinking.com".freeze
  s.homepage = "https://rubyonrails.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Job framework with pluggable queues.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, ["= 6.1.7.3"])
    s.add_runtime_dependency(%q<globalid>.freeze, [">= 0.3.6"])
  else
    s.add_dependency(%q<activesupport>.freeze, ["= 6.1.7.3"])
    s.add_dependency(%q<globalid>.freeze, [">= 0.3.6"])
  end
end