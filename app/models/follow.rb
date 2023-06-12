class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :house


  validates :user_id, uniqueness: {scope: :house_id}
end
