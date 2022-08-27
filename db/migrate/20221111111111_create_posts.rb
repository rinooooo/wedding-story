class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer    :attendance_id,       null: false
      t.string     :name,                null: false
      t.string     :name_kana,           null: false
      t.string     :name,                null: false
      t.string     :category_id,         null: false
      t.string     :address,             null: false
      t.string     :mail,                null: false
      t.date       :departure,           null: false
      t.date       :go_home,             null: false
      t.integer    :community,           null: false
      t.text       :message,             null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
