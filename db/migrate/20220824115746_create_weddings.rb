class CreateWeddings < ActiveRecord::Migration[6.0]
  def change
    create_table :weddings do |t|
      t.string     :gloom_name,          null: false
      t.string     :bride_name,          null: false
      t.string     :gloom_name_en,       null: false
      t.string     :bride_name_en,       null: false
      t.date       :date,                null: false
      t.date       :answer_date,         null: false             
      t.text       :message,             null: false
      t.string     :location,            null: false
      t.string     :url,                 null: false
      t.string     :address,             null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
