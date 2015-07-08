class RenameImagesInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :cover_image, :cover
    rename_column :events, :trailer_image, :trailer
  end
end
