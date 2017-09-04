class AddPremiumDetailsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :hours, :text
    add_column :businesses, :reservation, :text
    add_column :businesses, :premium, :boolean
  end
end
