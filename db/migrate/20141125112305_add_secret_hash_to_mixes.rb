class AddSecretHashToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :secret_hash, :string
  end
end
