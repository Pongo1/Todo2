class AddUserIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :items_id, :integer
  end
end
