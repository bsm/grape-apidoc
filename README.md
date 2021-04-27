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

## API example

```ruby
class SomeAPI < Grape::API do
  prefix 'api'
  version 'v1'

  desc 'List Foos' do
    success Mock::Foo::Entity
    is_array true
    security required: %w[foo/bar.baz foo/bar.qux]
  end
  params do
    optional :normal
    optional :nested, type: Hash do
      optional :sub
    end
  end
  get('/foos') { [Mock::Foo.new(foo_id: 1)] }
end
```
