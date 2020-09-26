class AddAccountIdToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_index :profiles, :account_id
  end
end
