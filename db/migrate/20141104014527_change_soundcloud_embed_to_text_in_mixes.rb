class ChangeSoundcloudEmbedToTextInMixes < ActiveRecord::Migration
  def up
   change_column :mixes, :soundcloud_embed, :text
  end

  def down
   change_column :mixes, :soundcloud_embed, :string
  end
end
