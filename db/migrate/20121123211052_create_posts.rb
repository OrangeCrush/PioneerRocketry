class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :posted
      t.boolean :public
      t.string :image

      t.timestamps
    end
  end
end
