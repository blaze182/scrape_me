class AddWarrantyProviderToPlatform < ActiveRecord::Migration
  def change
    add_column :platforms, :warranty_provider, :integer
  end
end
