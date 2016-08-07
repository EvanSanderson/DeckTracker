class CreateMatchups < ActiveRecord::Migration[5.0]
  def change
    create_table :matchups do |t|
      t.string :character_class
      t.string :play_style
      t.integer :wins
      t.integer :losses
      t.string :notes
      t.references :deck, index: true, foreign_key: true
      t.timestamps
    end
  end
end
