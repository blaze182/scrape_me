require 'rails_helper'

RSpec.describe Warranty, type: :model do
  it { should belong_to :device }
  it { should define_enum_for :status }

  let(:platform) { Platform.create(name: 'ios') }

  let(:device_in_warranty) {
    Device.create({
      imei: "013977000323877",
      platform: platform,
      location: "MyString",
      email: "qwe@qwe.com",
      manager: "MyString"
    })
  }

  let(:device_out_of_warranty) {
    Device.create({
      imei: "013896000639712",
      platform: platform,
      location: "MyString",
      email: "qwe@qwe.com",
      manager: "MyString"
    })
  }

  let(:invalid_device) {
    Device.create({
      imei: "356938035643809",
      platform: platform,
      location: "MyString",
      email: "qwe@qwe.com",
      manager: "MyString"
    })
  }

  it 'should set in_warranty status and estimated date for device_id in warranty', :vcr do
    warranty = Warranty.create(device_id: device_in_warranty.id)
    expect(warranty.status).to eq "in_warranty"
    expect(warranty.expiration).to eq Date.parse "August 10, 2016"
  end

  it 'should set out_of_warranty status for device_id out of warranty', :vcr do
    warranty = Warranty.create(device_id: device_out_of_warranty.id)
    expect(warranty.status).to eq "out_of_warranty"
  end

  it 'should not set warranty status for invalid imei', :vcr do
    warranty = Warranty.create(device_id: invalid_device.id)
    expect(warranty.status).to eq nil
  end
end
