class AddPublishedToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :published, :boolean, :default => false
  end
end
