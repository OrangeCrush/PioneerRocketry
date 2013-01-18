class AddpostedByTopost < ActiveRecord::Migration
  def change
    add_column :posts, :posted_by, :string
  end
end
