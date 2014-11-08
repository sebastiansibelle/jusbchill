class AddSoundcloudEmbedToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :soundcloud_embed, :text
  end
end
