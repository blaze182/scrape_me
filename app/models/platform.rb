class Platform < ActiveRecord::Base
  has_many :devices

  validates :name, presence: true, uniqueness: true

  enum warranty_provider: [:apple]
end
