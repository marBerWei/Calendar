class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
