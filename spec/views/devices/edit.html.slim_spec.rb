require 'rails_helper'

RSpec.describe "devices/edit", type: :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :imei => "MyString",
      :platform => nil,
      :location => "MyString",
      :email => "MyString",
      :manager => "MyString"
    ))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(@device), "post" do

      assert_select "input#device_imei[name=?]", "device[imei]"

      assert_select "input#device_platform[name=?]", "device[platform]"

      assert_select "input#device_location[name=?]", "device[location]"

      assert_select "input#device_email[name=?]", "device[email]"

      assert_select "input#device_manager[name=?]", "device[manager]"
    end
  end
end
