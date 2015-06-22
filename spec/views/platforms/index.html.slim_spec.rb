require 'rails_helper'

RSpec.describe "platforms/index", type: :view do
  before(:each) do
    assign(:platforms, [
      Platform.create!(
        :name => "Name1"
      ),
      Platform.create!(
        :name => "Name2"
      )
    ])
  end

  it "renders a list of platforms" do
    render
    assert_select "tr>td", :text => "Name1", :count => 1
    assert_select "tr>td", :text => "Name2", :count => 1
  end
end
