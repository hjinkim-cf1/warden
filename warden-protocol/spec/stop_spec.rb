# encoding: UTF-8

require 'spec_helper'

describe Warden::Protocol::StopRequest do
  subject(:request) do
    described_class.new(handle: 'handle')
  end

  it_should_behave_like 'wrappable request'

  it 'has a class type' do
    expect(request.class.type_camelized).to eq('Stop')
    expect(request.class.type_underscored).to eq('stop')
  end

  field :handle do
    it_should_be_required
  end

  field :background do
    it_should_be_optional
    it_should_be_typed_as_boolean
  end

  field :kill do
    it_should_be_optional
    it_should_be_typed_as_boolean
  end

  it 'should respond to #create_response' do
    request.create_response.should be_a(Warden::Protocol::StopResponse)
  end
end

describe Warden::Protocol::StopResponse do
  subject(:response) do
    described_class.new
  end

  it_should_behave_like 'wrappable response'

  it 'has a class type' do
    expect(response.class.type_camelized).to eq('Stop')
    expect(response.class.type_underscored).to eq('stop')
  end

  it { should be_ok }
  it { should_not be_error }
end
