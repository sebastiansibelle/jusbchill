class AddReleaseNoToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :release_no, :string
  end
end
