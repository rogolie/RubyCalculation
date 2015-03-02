class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :card_id
      t.string :card_state

      t.timestamps
    end
  end
end
