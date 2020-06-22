class CreateJedis < ActiveRecord::Migration[6.0]
  def change
    create_table :jedis do |t|
      t.string :name
      t.string :race
      t.string :home_planet
      t.integer :user_id
    end
  end
end
