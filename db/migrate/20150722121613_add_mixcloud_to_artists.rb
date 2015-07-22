class AddMixcloudToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :mixcloud, :string
  end
end
