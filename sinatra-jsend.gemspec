Gem::Specification.new do |s|
  s.name             = "sinatra-jsend"
  s.version          = "0.1.0"
  s.description      = "JSend helper for Sinatra"
  s.summary          = s.description
  s.homepage         = "http://github.com/axic/#{s.name}"

  s.authors          = "Alex Beregszaszi"
  s.email            = "alex@rtfs.hu"
 
  s.add_dependency "sinatra",         "~> 1.3.0"
  s.add_dependency "sinatra-contrib", "~> 1.3.0"

  s.add_development_dependency "rspec", "~> 2.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "json"

  s.files            = Dir["**/*.{rb,md}"]+['Rakefile', 'LICENSE']
  s.require_paths    = ["lib"]
end
