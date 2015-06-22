class Platform < ActiveRecord::Base
  has_many :devices

  validates :name, presence: true, uniqueness: true
end
