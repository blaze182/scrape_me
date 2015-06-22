require 'rails_helper'

RSpec.describe Platform, type: :model do
  it { should have_many :devices }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
