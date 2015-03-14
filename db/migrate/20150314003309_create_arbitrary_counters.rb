class CreateArbitraryCounters < ActiveRecord::Migration
  def change
    create_table :arbitrary_counters do |t|
      t.integer :counter, default: 0

      t.timestamps null: false
    end
  end
end
