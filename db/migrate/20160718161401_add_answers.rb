class AddAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.string :body, null: false
      t.timestamps null: false
    end
  end
end
