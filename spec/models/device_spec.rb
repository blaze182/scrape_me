require 'rails_helper'

RSpec.describe Device, type: :model do
  it { should belong_to :platform }
  it { should ensure_valid_email_format_of :email }
  it { should ensure_valid_imei_format_of :imei }
  it { should validate_uniqueness_of :imei }
  it { should validate_presence_of :imei }
  it { should validate_presence_of :email }
  it { should validate_presence_of :platform }
  it { should validate_presence_of :manager }
end
