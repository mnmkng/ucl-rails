class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :code
      t.integer :study_type
      t.integer :language

      t.timestamps
    end
  end
end
