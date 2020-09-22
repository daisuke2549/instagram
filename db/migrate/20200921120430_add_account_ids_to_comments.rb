class AddAccountIdsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :account_id, :integer
  end
end
