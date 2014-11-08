class AddSoundcloudEmbedToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :soundcloud_embed, :text
  end
end
