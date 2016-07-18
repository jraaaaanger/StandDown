class AddTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps null: false
      t.string :timezone, null: false
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.belongs_to :organization
    end
  end
end
