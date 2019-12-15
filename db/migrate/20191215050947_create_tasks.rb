class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.string :state
      t.string :task
      t.date :limit_date
      t.timestamps
    end
  end
end
