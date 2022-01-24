class RemoveViewsFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :views, :integer
  end
end
