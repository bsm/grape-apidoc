# grape-apidoc

[Rake](https://github.com/ruby/rake) task to generate [Markdown](https://en.wikipedia.org/wiki/Markdown) documentation for [Grape](https://github.com/ruby-grape/grape)/[Grape::Entity](https://github.com/ruby-grape/grape-entity)-based APIs

## Getting started

```ruby
# Gemfile
group :development do # most common use env is env=development
  gem 'grape-apidoc'
end
```

```ruby
# Rakefile
begin
  require 'grape/apidoc'
  Grape::Apidoc::RakeTask.new(:apidoc, root_api_class: Grape::App) # point it to the top-level API class
rescue LoadError
  nil # so it does not fail in non-development environment
end
```
