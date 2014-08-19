class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.text :description
      t.references :artist, index: true

      t.timestamps
    end
  end
end
