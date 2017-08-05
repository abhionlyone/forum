class Tag < ActiveRecord::Base
  has_many :user_tags, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :users, through: :user_tags
  has_many :questions, through: :question_tags
end
