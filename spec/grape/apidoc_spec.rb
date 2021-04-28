require 'spec_helper'

RSpec.describe Grape::Apidoc do
  subject(:apidoc) do
    described_class.new(api, output: doc)
  end

  let(:api) do
    Class.new(Grape::API) do
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
  end

  let(:doc) { StringIO.new }

  before do
    apidoc.write!
  end

  it 'documents api' do
    # File.write('spec/fixtures/golden.md', doc.string)
    expect(doc.string.strip).to eq(File.read('spec/fixtures/golden.md').strip)
  end
end
