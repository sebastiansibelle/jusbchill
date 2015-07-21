class AddWebsiteToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :website, :string
    add_column :artists, :bandcamp, :string
  end
end
