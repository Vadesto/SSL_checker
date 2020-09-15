class ChangingNameToUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :links, :name, :url
  end
end
