require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        :imei => "Imei",
        :platform => nil,
        :location => "Location",
        :email => "Email",
        :manager => "Manager"
      ),
      Device.create!(
        :imei => "Imei",
        :platform => nil,
        :location => "Location",
        :email => "Email",
        :manager => "Manager"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "Imei".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Manager".to_s, :count => 2
  end
end
