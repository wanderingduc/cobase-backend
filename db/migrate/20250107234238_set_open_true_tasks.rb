class SetOpenTrueTasks < ActiveRecord::Migration[8.0]
  def change
    change_column_default :tasks, :open, from: nil, to: true
  end
end
