class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :thumbnail
      t.string :file
      t.integer :views, :default => 0

      t.timestamps
    end
  end
end
