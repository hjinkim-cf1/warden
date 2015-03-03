# encoding: UTF-8

require 'spec_helper'

describe Warden::Protocol::CreateRequest do
  subject(:request) do
    described_class.new
  end

  it_should_behave_like 'wrappable request'

  it 'has a class type' do
    expect(request.class.type_camelized).to eq('Create')
    expect(request.class.type_underscored).to eq('create')
  end

  field :bind_mounts do
    it_should_be_optional

    it 'should be populated with BindMount objects' do
      m = Warden::Protocol::CreateRequest::BindMount.new
      m.src_path = '/src'
      m.dst_path = '/dst'
      m.mode = Warden::Protocol::CreateRequest::BindMount::Mode::RO

      subject.bind_mounts = [m]
      subject.should be_valid
    end
  end

  field :grace_time do
    it_should_be_optional
    it_should_be_typed_as_uint
  end

  field :handle do
    it_should_be_optional
    it_should_be_typed_as_string
  end

  field :network do
    it_should_be_optional
    it_should_be_typed_as_string
  end

  field :rootfs do
    it_should_be_optional
    it_should_be_typed_as_string
  end

  it 'should respond to #create_response' do
    request.create_response.should be_a(Warden::Protocol::CreateResponse)
  end
end

describe Warden::Protocol::CreateResponse do
  subject(:response) do
    described_class.new(handle: 'handle')
  end

  it_should_behave_like 'wrappable response'

  it 'has a class type' do
    expect(response.class.type_camelized).to eq('Create')
    expect(response.class.type_underscored).to eq('create')
  end

  it { should be_ok }
  it { should_not be_error }

  field :handle do
    it_should_be_required
  end
end
