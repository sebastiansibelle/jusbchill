class CreatePerformances < ActiveRecord::Migration
  def change
     create_table :performances do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :event, index: true

      t.string :audio_url
      t.text :audio_embed
      t.string :video_url
      t.text :video_embed
      t.boolean :featured
      t.timestamps null: false
    end
  end
end
