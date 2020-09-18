class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :reps
      t.integer :sets
      t.belongs_to :user

      t.timestamps
    end
  end
end
