class AddDownloadLinkToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :download_link, :string
  end
end
