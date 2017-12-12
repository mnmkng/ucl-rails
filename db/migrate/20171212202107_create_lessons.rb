class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :duration
      t.references :room, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
