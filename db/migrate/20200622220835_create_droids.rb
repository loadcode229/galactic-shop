class CreateDroids < ActiveRecord::Migration[6.0]
  def change
    create_table :droids do |t|
      t.string :name
      t.string :colors
      t.string :droid_model
      t.integer :user_id
    end
  end
end
