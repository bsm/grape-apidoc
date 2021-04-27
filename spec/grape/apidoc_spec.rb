require 'spec_helper'

RSpec.describe Grape::Apidoc do
  subject(:apidoc) do
    described_class.new(api, output: doc)
  end

  let(:api) do
    Class.new(Grape::API) do
      prefix 'api'
      version 'v1'

      desc 'List Foos'
      get('/foos') { 'OK' }

      desc 'Get Bar'
      get('/bars/:id') { 'OK' }
    end
  end

  let(:doc) { StringIO.new }

  before do
    apidoc.write!
  end

  xit 'should detect root api class unless provided' # TODO: maybe make that method public

  it 'documents routes' do
    expect(doc.string).to include('## GET /api/v1/foos')
    expect(doc.string).to include('## GET /api/v1/bars/:id')
  end

  xit 'should document route permissions' # assert perms
  xit 'should document route return value' # assert retval (link to entity)
  xit 'should document route params' # assert params

  xit 'should document entities' # assert entities (headers)
  xit 'should document entity fields' # assert fields (name, type, description; maybe AR enums later)
end
