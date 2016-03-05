class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :name
      t.string :phone
      t.string :email
    end
  end
end
