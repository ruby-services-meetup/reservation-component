# -*- encoding: utf-8 -*-
# stub: evt-entity_projection 0.3.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "evt-entity_projection".freeze
  s.version = "0.3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["The Eventide Project".freeze]
  s.date = "2017-06-01"
  s.description = " ".freeze
  s.email = "opensource@eventide-project.org".freeze
  s.homepage = "https://github.com/eventide-project/entity-projection".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.3".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Projects event data into an entity".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<evt-messaging>.freeze, [">= 0"])
      s.add_development_dependency(%q<test_bench>.freeze, [">= 0"])
      s.add_development_dependency(%q<evt-message_store-postgres>.freeze, [">= 0"])
    else
      s.add_dependency(%q<evt-messaging>.freeze, [">= 0"])
      s.add_dependency(%q<test_bench>.freeze, [">= 0"])
      s.add_dependency(%q<evt-message_store-postgres>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<evt-messaging>.freeze, [">= 0"])
    s.add_dependency(%q<test_bench>.freeze, [">= 0"])
    s.add_dependency(%q<evt-message_store-postgres>.freeze, [">= 0"])
  end
end
