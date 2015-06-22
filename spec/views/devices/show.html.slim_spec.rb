require 'rails_helper'

RSpec.describe "devices/show", type: :view do
  before(:each) do
    @platform = assign(:platform, Platform.create!(
      :name => "PLTFM"
    ))
    @device = assign(:device, Device.create!(
      :imei => "356938035643809",
      :platform => @platform,
      :location => "Location",
      :email => "qwe@qwe.com",
      :manager => "Manager"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/356938035643809/)
    expect(rendered).to match(/PLTFM/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/qwe@qwe.com/)
    expect(rendered).to match(/Manager/)
  end
end
