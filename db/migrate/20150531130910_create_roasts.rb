class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
