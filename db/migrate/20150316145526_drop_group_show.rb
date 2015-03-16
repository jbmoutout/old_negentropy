class DropGroupShow < ActiveRecord::Migration
  def change
        drop_table :group_shows

  end
end
