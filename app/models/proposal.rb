class Proposal < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user_id, :forked_from_id, :slug, :category, :forked_from

  paginates_per 20

  has_many :proposal_comments

  extend FriendlyId
  friendly_id :title, use: [:history, :slugged]

  belongs_to :forked_from, class_name: 'Proposal'

  has_many :forked_to, class_name: 'Proposal'

  def commenters
    proposal_comments.includes(:user).collect{|comment| comment.user}.uniq
  end

  def participants
    (commenters + [user]).uniq
  end

  def participants_count
    participants.size
  end

end
