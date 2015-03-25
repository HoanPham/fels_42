class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :lessons, :categories
    add_foreign_key :lessons, :users
  end
end
