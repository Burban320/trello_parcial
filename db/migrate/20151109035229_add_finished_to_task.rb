class AddFinishedToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :finished, :boolean
  end
end
