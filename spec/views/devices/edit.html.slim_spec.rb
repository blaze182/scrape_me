require 'rails_helper'

RSpec.describe "devices/edit", type: :view do
  before(:each) do
    @platform = assign(:platform, Platform.create!(
      :name => "MyString"
    ))
    @device = assign(:device, Device.create!(
      :imei => "356938035643809",
      :platform => @platform,
      :location => "MyString",
      :email => "qwe@qwe.com",
      :manager => "MyString"
    ))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(@device), "post" do

      assert_select "input#device_imei[name=?]", "device[imei]"

      assert_select "select#device_platform_id[name=?]", "device[platform_id]"

      assert_select "input#device_location[name=?]", "device[location]"

      assert_select "input#device_email[name=?]", "device[email]"

      assert_select "input#device_manager[name=?]", "device[manager]"
    end
  end
end
