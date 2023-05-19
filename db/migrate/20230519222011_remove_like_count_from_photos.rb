class RemoveLikeCountFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :like_count, :integer
  end
end
