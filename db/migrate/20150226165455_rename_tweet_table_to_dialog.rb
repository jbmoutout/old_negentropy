class RenameTweetTableToDialog < ActiveRecord::Migration
  def change
    rename_table :tweets, :dialogs
  end
end
