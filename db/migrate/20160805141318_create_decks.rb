class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
      t.string :character_class
      t.string :img_url
      t.references :player, index: true, foreign_key: true
      t.timestamps
    end
  end
end
