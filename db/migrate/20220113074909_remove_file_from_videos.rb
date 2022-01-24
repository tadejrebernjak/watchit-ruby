class RemoveFileFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :file, :string
  end
end
