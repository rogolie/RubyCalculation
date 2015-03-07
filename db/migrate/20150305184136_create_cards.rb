class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string 'card_id'
      t.integer 'value'
      t.string 'suit'
      t.timestamps
    end
  end
end
