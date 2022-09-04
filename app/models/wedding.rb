class Wedding < ApplicationRecord
  belongs_to :user, optional: true
  has_many :posts
  has_many :communities
  validates :gloom_name, :bride_name, :gloom_name_en, :bride_name_en, :date, :answer_date, :message, :location, :url, presence: true
end
