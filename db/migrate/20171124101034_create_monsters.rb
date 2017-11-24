class CreateMonsters < ActiveRecord::Migration[5.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :image
      t.string :health
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
