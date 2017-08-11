# -*- encoding: utf-8 -*-
# stub: evt-message_store-postgres 0.3.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "evt-message_store-postgres".freeze
  s.version = "0.3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["The Eventide Project".freeze]
  s.bindir = "scripts".freeze
  s.date = "2017-08-03"
  s.description = " ".freeze
  s.email = "opensource@eventide-project.org".freeze
  s.executables = ["evt-pg-delete-db".freeze, "evt-pg-list-messages".freeze, "evt-pg-create-db".freeze, "evt-pg-recreate-db".freeze]
  s.files = ["scripts/evt-pg-create-db".freeze, "scripts/evt-pg-delete-db".freeze, "scripts/evt-pg-list-messages".freeze, "scripts/evt-pg-recreate-db".freeze]
  s.homepage = "https://github.com/eventide-project/message-store-postgres".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Message store implementation for PostgreSQL".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<evt-message_store>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<evt-log>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<evt-settings>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<pg>.freeze, [">= 0"])
      s.add_development_dependency(%q<test_bench>.freeze, [">= 0"])
    else
      s.add_dependency(%q<evt-message_store>.freeze, [">= 0"])
      s.add_dependency(%q<evt-log>.freeze, [">= 0"])
      s.add_dependency(%q<evt-settings>.freeze, [">= 0"])
      s.add_dependency(%q<pg>.freeze, [">= 0"])
      s.add_dependency(%q<test_bench>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<evt-message_store>.freeze, [">= 0"])
    s.add_dependency(%q<evt-log>.freeze, [">= 0"])
    s.add_dependency(%q<evt-settings>.freeze, [">= 0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<test_bench>.freeze, [">= 0"])
  end
end
