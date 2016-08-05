class CreateMeta < ActiveRecord::Migration[5.0]
  def change
    create_table :meta do |t|
        t.string :play_style
        t.references :deck, index: true, foreign_key: true
        t.references :card, index: true, foreign_key: true
      t.timestamps
    end
  end
end
