class CreatePostSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :post_selects do |t|
      t.string :is_select
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
