class ChangeDefaultValueOfStatusToBeZero < ActiveRecord::Migration[6.0]
  def change
    change_column :links, :status, :integer, null: false, default: 0
  end
end
