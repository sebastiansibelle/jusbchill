class AddSecretHashToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :secret_hash, :string
  end
end
