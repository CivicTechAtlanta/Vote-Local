class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :district_id
    end
  end
end
