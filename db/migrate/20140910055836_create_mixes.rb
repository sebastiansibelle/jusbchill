class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.string :mix_no
      t.string :title
      t.text :description
      t.string :avatar
      t.integer :artist_id
      t.string :soundcloud_embed
      t.boolean :published, :default => false
      t.string :slug, :unique => true

      t.timestamps
    end

    add_index :mixes, :slug, unique: true
  end
end
