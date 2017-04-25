class CreateProductScores < ActiveRecord::Migration[5.0]
  def change
    create_table :product_scores do |t|
      t.integer :score
      t.belongs_to :product
      t.belongs_to :user
      t.timestamps
    end
  end
end
