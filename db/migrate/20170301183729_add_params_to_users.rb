class AddParamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ssn, :integer
    add_column :users, :company, :string
  end
end
