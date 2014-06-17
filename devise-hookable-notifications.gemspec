Gem::Specification.new do |s|
  s.name        = "devise-hookable-notifications"
  s.version     = File.read('VERSION').strip
  s.authors     = ["Brent Vatne"]
  s.email       = %w[brent.vatne@gmail.com]
  s.homepage    = "https://github.com/brentvatne/devise-hookable-notifications"
  s.summary     = "Hooks to run some code around notification events for Devise"
  s.description = "Hooks to run some code around notification events for Devise"

  s.files = Dir["{lib}/**/*"] + %w{README.md}
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "activesupport", ">= 3.0.0"
  s.add_dependency "activerecord", ">= 3.0.0"
  s.add_dependency "devise", "~> 3.2.3"
end
