class AddDescriptionToRoasts < ActiveRecord::Migration
  def change
    add_column :roasts, :description, :text
  end
end
