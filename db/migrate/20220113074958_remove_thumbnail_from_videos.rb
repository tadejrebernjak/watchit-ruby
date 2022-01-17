class RemoveThumbnailFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :thumbnail, :string
  end
end
