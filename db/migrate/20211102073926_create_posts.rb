class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :post_body
      t.text :select_a
      # ーー選択肢A文章
      t.text :select_b
      # ーー選択肢Bの文章
      t.string :post_image_id
      # ーー画像選択用
      t.integer :"post_tag_id"

      t.timestamps
    end
  end
end
