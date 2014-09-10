class AddBuyLinkToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :buy_link, :string
  end
end
