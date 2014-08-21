class AddAvatarToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :avatar, :string
  end
end
