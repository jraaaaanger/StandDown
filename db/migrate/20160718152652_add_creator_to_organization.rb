class AddCreatorToOrganization < ActiveRecord::Migration
  def change
    add_reference :organizations, :creator, references: :users
  end
end
