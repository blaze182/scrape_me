require 'rails_helper'

RSpec.describe Warranty, type: :model do
  it { should belong_to :device }
end
