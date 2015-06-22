require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    @platform = assign(:platform, Platform.create!(
      :name => "PLTFM"
    ))
    assign(:devices, [
      Device.create!(
        :imei => "356938035643809",
        :platform => @platform,
        :location => "Location",
        :email => "qwe@qwe.com",
        :manager => "Manager"
      ),
      Device.create!(
        :imei => "357805023984942",
        :platform => @platform,
        :location => "Location",
        :email => "qwe@qwe.com",
        :manager => "Manager"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "356938035643809".to_s, :count => 1
    assert_select "tr>td", :text => "357805023984942".to_s, :count => 1
    assert_select "tr>td", :text => "PLTFM", :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "qwe@qwe.com".to_s, :count => 2
    assert_select "tr>td", :text => "Manager".to_s, :count => 2
  end
end
