class AddStartTimeToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :start, :time, null: false
  end
end
