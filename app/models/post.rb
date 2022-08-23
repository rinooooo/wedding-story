class Post < ApplicationRecord
  t.string     :name,                null: false
  t.text       :message,             null: false
  t.integer    :attendance_id,       null: false
end
