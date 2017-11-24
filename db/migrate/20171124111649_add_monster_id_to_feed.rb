class AddMonsterIdToFeed < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :monster_id, :integer
  end
end
