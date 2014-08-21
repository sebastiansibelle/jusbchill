class AddAvatarToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :avatar, :string
  end
end
