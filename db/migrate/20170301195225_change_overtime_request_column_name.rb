class ChangeOvertimeRequestColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :overtime_request, :daily_hours
  end
end
