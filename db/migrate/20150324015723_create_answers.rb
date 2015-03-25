class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_right
      t.references :word, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :words
  end
end