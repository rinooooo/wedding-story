class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string     :comment,             null: false
      t.references :wedding, foreign_key: true, null: false
      t.timestamps
    end
  end
end
