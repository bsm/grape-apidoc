require 'spec_helper'

RSpec.describe Grape::Apidoc do
  subject(:apidoc) do
    described_class.new(Example::API, output: doc) # see spec/scenario for Example::* impl
  end

  let(:doc) { StringIO.new }

  before do
    apidoc.write!
  end

  it 'documents api' do
    # File.write('spec/fixtures/example.md', doc.string)
    expect(doc.string.strip).to eq(File.read('spec/fixtures/example.md').strip)
  end
end
