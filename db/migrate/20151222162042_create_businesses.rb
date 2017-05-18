class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :image
      t.string :address
      t.text :description
      t.string :website
      t.references :category
    end
  end
end
