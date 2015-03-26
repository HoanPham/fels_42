class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.references :word, index: true
      t.references :answer, index: true
      t.references :lesson, index: true

      t.timestamps null: false
    end
    add_foreign_key :lesson_words, :words
    add_foreign_key :lesson_words, :answers
    add_foreign_key :lesson_words, :lessons
  end
end
