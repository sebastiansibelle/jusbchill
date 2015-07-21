class AddFacebookImageToEvent < ActiveRecord::Migration
  def change
    add_column :events, :facebook_image, :string, after: :trailer
  end
end
