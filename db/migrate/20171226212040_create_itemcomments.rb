class CreateItemcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :itemcomments do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :item_id
      t.string :body
      t.string :title

      t.timestamps
    end
  end
end
