class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :name,                null: false
      t.text       :message,             null: false
      t.integer    :attendance_id,       null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
