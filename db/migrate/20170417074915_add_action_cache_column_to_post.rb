class AddActionCacheColumnToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :likes_count, :integer, default: 0
    add_column :posts, :stars_count, :integer, default: 0
  end
end
