# encoding: UTF-8

require 'spec_helper'

describe Warden::Protocol::PingRequest do
  subject(:request) do
    described_class.new
  end

  it_should_behave_like 'wrappable request'

  it 'has a class type' do
    expect(request.class.type_camelized).to eq('Ping')
    expect(request.class.type_underscored).to eq('ping')
  end

  it 'should respond to #create_response' do
    request.create_response.should be_a(Warden::Protocol::PingResponse)
  end
end

describe Warden::Protocol::PingResponse do
  subject(:response) do
    described_class.new
  end

  it_should_behave_like 'wrappable response'

  it 'has a class type' do
    expect(response.class.type_camelized).to eq('Ping')
    expect(response.class.type_underscored).to eq('ping')
  end

  it { should be_ok }
  it { should_not be_error }
end
