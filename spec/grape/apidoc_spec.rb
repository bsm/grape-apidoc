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
      params do
        optional :normal
        optional :nested, type: Hash do
          optional :sub
        end
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

  it 'documents api' do
    expect(doc.string.strip).to eq(File.read('spec/fixtures/golden.md').strip)
  end
end
