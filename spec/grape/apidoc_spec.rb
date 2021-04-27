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
      end
      get('/foos') { [Mock::Foo.new(foo_id: 1)] }

      desc 'Get Bar' do
        success Mock::Bar::Entity
      end
      get('/bars/:id') { Mock::Bar.new(bar_id: 2) }
    end
  end

  let(:doc) { StringIO.new }

  before do
    apidoc.write!
  end

  xit 'should detect root api class unless provided' # TODO: maybe make that method public

  it 'documents routes' do
    expect(doc.string).to include("## GET /api/v1/foos\n\nList Foos\n\n")
    expect(doc.string).to include("## GET /api/v1/bars/:id\n\nGet Bar\n\n")
  end

  xit 'should document route permissions' # assert perms

  it 'documents route return value' do
    expect(doc.string).to include("Returns: List of [Mock::Foo::Entity](#mock--foo--entity)\n\n")
    expect(doc.string).to include("Returns: [Mock::Bar::Entity](#mock--bar--entity)\n\n")
  end

  xit 'should document route params' # assert params

  it 'documents entities' do
    expect(doc.string).to include("## Mock::Foo::Entity\n\n")
    expect(doc.string).to include("## Mock::Bar::Entity\n\n")
  end

  it 'documents entity fields' do
    # TODO: maybe assert ActiveRecord types (incl. enums) later
    expect(doc.string).to match(/\| Field\s* \| Type\s* | Description\s* |\n/)
    expect(doc.string).to match(/\| foo_id\s* \| Integer\s* | Foo ID\s* |\n/)
    expect(doc.string).to match(/\| bar_id\s* \| Integer\s* | Bar ID\s* |\n/)
  end
end
