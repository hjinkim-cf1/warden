# encoding: UTF-8

require 'spec_helper'

describe Warden::Protocol::DestroyRequest do
  subject(:request) do
    described_class.new(handle: 'handle')
  end

  it_should_behave_like 'wrappable request'

  it 'has a class type' do
    expect(request.class.type_camelized).to eq('Destroy')
    expect(request.class.type_underscored).to eq('destroy')
  end

  field :handle do
    it_should_be_required
  end

  it 'should respond to #create_response' do
    request.create_response.should be_a(Warden::Protocol::DestroyResponse)
  end
end

describe Warden::Protocol::DestroyResponse do
  subject(:response) do
    described_class.new
  end

  it_should_behave_like 'wrappable response'

  it 'has a class type' do
    expect(response.class.type_camelized).to eq('Destroy')
    expect(response.class.type_underscored).to eq('destroy')
  end

  it { should be_ok }
  it { should_not be_error }
end
