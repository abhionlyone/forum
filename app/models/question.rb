class Question < ActiveRecord::Base
  attr_accessor :tags

  belongs_to :user
  has_many :answers
  has_many :question_tags

  after_create :create_question_tags
  after_update :create_question_tags

  def create_question_tags
    if !tags.nil?
      question_tags.destroy_all
      tags.each {|tag| self.question_tags.create(tag_id: tag)}
    end  
  end

end
