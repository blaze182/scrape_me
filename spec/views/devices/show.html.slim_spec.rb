require 'rails_helper'

RSpec.describe "devices/show", type: :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :imei => "Imei",
      :platform => nil,
      :location => "Location",
      :email => "Email",
      :manager => "Manager"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Imei/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Manager/)
  end
end
