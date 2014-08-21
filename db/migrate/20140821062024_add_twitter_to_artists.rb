class AddTwitterToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :twitter, :string
  end
end
