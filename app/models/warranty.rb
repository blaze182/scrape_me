class Warranty < ActiveRecord::Base
  belongs_to :device

  enum status: [:in_warranty, :out_of_warranty]

  before_validation :fetch_warranty

  private

  def fetch_warranty
    warranty = Iscraper.get_warranty_status self.device.imei

    # handle scraper response and set Warranty fields
    if warranty.has_key? :warranty_status
      if warranty[:warranty_status]
        self.status     = :in_warranty
        self.expiration = warranty[:expiration_date]
      else
        self.status     = :out_of_warranty
      end
    elsif warranty.has_key? :error
      Rails.logger.error warranty[:error]
    end
  end
end
