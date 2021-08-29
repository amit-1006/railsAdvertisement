class AddEmailToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :emailId, :string
  end
end
