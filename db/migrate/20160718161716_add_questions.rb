class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.belongs_to :organization
    end
  end
end
