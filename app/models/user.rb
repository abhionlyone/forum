class User < ActiveRecord::Base
  attr_accessor :tags

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers
  has_many :user_tags

  after_create :create_user_tags
  after_update :create_user_tags

  def create_user_tags
    user_tags.destroy_all
    tags.each {|tag| self.user_tags.create(tag_id: tag)}
  end

  def might_be_interseted_questions
    tag_ids = user_tags.pluck(:tag_id)
    question_tags = QuestionTag.where(:tag_id => tag_ids ).pluck(:question_id)
    questions = Question.where(:id => question_tags)
  end
end
