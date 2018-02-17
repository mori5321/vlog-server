class RemoveColumnFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pwd, :string
  end
end
