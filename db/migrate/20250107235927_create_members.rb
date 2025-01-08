class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members, primary_key: [:user_id, :group_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
