class Device < ActiveRecord::Base
  belongs_to :platform
  has_one :warranty

  validates :email, email: true, presence: true
  validates :imei, imei: true, presence: true, uniqueness: true
  validates :platform_id, :manager, presence: true

  after_save :refresh_warranty

  private

  def refresh_warranty
    if self.platform
      if self.platform.warranty_provider == "apple"
        w = Warranty.where(device_id: self.id).first_or_initialize
        w.save
      else # clear warranty (if we updated device warranty_provider, for instance)
        Warranty.where(device_id: self.id).destroy_all
      end
    end
  end
end
