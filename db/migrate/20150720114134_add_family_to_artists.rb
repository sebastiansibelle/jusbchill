class AddFamilyToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :family, :boolean
  end
end
