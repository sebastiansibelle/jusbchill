class CreateArtistsEvents < ActiveRecord::Migration
  def change
    create_join_table :artists, :events
  end
end
