class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.integer :score
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
