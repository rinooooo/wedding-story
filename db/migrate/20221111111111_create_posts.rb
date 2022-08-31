class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :attendance  ,        null: false
      t.string     :name,                null: false
      t.string     :name_kana,           null: false
      t.string     :category_gloom      
      t.string     :category_bride      
      t.string     :address,             null: false
      t.string     :mail,                null: false
      t.date       :departure          
      t.date       :go_home             
      t.text       :message,             null: false
      t.references :wedding, foreign_key: true, null: false
      t.timestamps
    end
  end
end
