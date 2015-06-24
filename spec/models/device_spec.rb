require 'rails_helper'

RSpec.describe Device, type: :model do
  it { should belong_to :platform }
  it { should ensure_valid_email_format_of :email }
  it { should ensure_valid_imei_format_of :imei }
  it { should validate_uniqueness_of :imei }
  it { should validate_presence_of :imei }
  it { should validate_presence_of :email }
  it { should validate_presence_of :platform_id }
  it { should validate_presence_of :manager }

  it { should have_one(:warranty).dependent(:destroy) }

  let(:apple_platform) { Platform.create(name: 'ios', warranty_provider: 'apple') }
  let(:not_apple_platform) { Platform.create(name: 'android') }
  let(:apple_device) {
    {
      imei: "013977000323877",
      platform: apple_platform,
      location: "MyString",
      email: "qwe@qwe.com",
      manager: "MyString"
    }
  }
  let(:not_apple_device) {
    {
      imei: "013977000323877",
      platform: not_apple_platform,
      location: "MyString",
      email: "qwe@qwe.com",
      manager: "MyString"
    }
  }

  it 'should create warranty for apple devices', :vcr do
    device = Device.create! apple_device
    expect(device.warranty).to be_kind_of Warranty
  end

  it 'should update warranty for apple_devices', :vcr do
    device = Device.create! not_apple_device
    device.reload
    device.platform = apple_platform
    device.save
    expect(device.warranty).to be_kind_of Warranty
  end

  it 'should not create warranty for non apple devices' do
    device = Device.create! not_apple_device
    expect(device.warranty).to eq nil
  end
end
