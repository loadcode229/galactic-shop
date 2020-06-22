class CreateLightsabers < ActiveRecord::Migration[6.0]
  def change
    create_table :lightsabers do |t|
      t.string :color
      t.string :saber_type
      t.string :saber_handle
      t.integer :user_id
    end
  end
end
