class Answer < ApplicationRecord
  belongs_to :question
  has_many :corrects, dependent: :destroy
  validates :body, presence: true
end
