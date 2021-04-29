require 'spec_helper'

RSpec.describe Grape::Apidoc do
  subject(:apidoc) do
    described_class.new(Mock::API, output: doc) # see spec/scenario for Mock::* impl
  end

  let(:doc) { StringIO.new }

  before do
    apidoc.write!
  end

  it 'documents api' do
    # File.write('spec/fixtures/mock_project.md', doc.string)
    expect(doc.string.strip).to eq(File.read('spec/fixtures/mock_project.md').strip)
  end
end
