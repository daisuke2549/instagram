class RemoveImagesFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :images, :string
  end
end
