class ChangeFamilyDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :artists, :family, :boolean, :default => false
  end
end
