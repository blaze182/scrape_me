class Device < ActiveRecord::Base
  belongs_to :platform

  validates :email, email: true, presence: true
  validates :imei, imei: true, presence: true, uniqueness: true
  validates :platform_id, :manager, presence: true
end
