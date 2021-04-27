Gem::Specification.new do |s|
  s.name        = 'grape-apidoc'
  s.version     = '0.0.1'
  s.authors     = ['Black Square Media Ltd.']
  s.email       = ['info@blacksquaremedia.com']
  s.summary     = 'Markdown documentation for Grape APIs'
  s.description = 'github.com/ruby/rake task to generate Markdown documentation for github.com/ruby-grape/grape + github.com/ruby-grape/grape-entity based APIs'
  s.homepage    = 'https://github.com/bsm/grape-apidoc'
  s.license     = 'Apache-2.0'

  s.files         = `git ls-files -z`.split("\x0").reject {|f| f.start_with?('spec/') }
  s.test_files    = `git ls-files -z -- spec/*`.split("\x0")
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 3.0'

  s.add_dependency 'grape'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop-bsm'
end
