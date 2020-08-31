class RemoveImgFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :img, :string
  end
end
