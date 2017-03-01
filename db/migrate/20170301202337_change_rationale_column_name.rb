class ChangeRationaleColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :rationale, :work_performed
  end
end
