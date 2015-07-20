class AddSecretHashToEvents < ActiveRecord::Migration
  def change
    add_column :events, :secret_hash, :string
  end
end