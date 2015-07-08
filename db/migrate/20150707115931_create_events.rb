class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :slug, :unique => true
      t.string :title
      t.text :lead
      t.text :description
      t.string :facebook_page
      t.string :facebook_event
      t.string :call_to_action_url
      t.string :call_to_action_text
      t.text :manifesto
      t.text :livestream
      t.datetime :start_date
      t.datetime :finish_date
      t.string :location
      t.string :cover_image
      t.string :trailer_image
      t.boolean :published, :default => false
      t.boolean :cool_room, :default => false
      t.string :thanks_header
      t.text   :thanks_text

      t.timestamps
    end

    add_index :events, :slug, unique: true
  end
end
