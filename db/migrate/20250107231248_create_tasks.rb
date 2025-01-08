class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :created_by
      t.string :owner
      t.boolean :open

      t.timestamps
    end
  end
end
