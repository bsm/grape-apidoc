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

## Supported app organisation example

```ruby
module Mock
  Foo = Struct.new(:foo_id) # model

  class Foo::Entity < Grape::Entity
    expose :foo_id, documentation: { type: 'Integer', desc: 'Foo ID' }
  end

  Bar = Struct.new(:bar_id, :foos) # model

  class Bar::Entity < Grape::Entity
    expose :bar_id, documentation: { type: 'Integer', desc: 'Bar ID' }
    expose :foos,
            using: Mock::Foo::Entity,
            documentation: { type: 'Object', is_array: true, desc: 'Associated Foos' }
  end
end
```


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
    optional :filter, type: Array do
      optional :foo_id, type: [Integer]
    end
  end
  get('/foos') { [Mock::Foo.new(foo_id: 1)] }

  desc 'Create Bar' do
    success Mock::Bar::Entity
  end
  params do
    optional :foos, type: Array[JSON] do
      optional :foo_id, type: Integer
    end
  end
  post('/bars/:id') do
    Mock::Bar.new(
      bar_id: 2,
      foos: [Mock::Foo.new(foo_id: 1)],
    )
  end
end
```
