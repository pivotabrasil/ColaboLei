class Proposal < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title

  paginates_per 20

  has_many :proposal_comments

  extend FriendlyId
  friendly_id :slug_candidates, use: [:history, :slugged]

  belongs_to :forked_from, class_name: 'Proposal'

  has_many :forked_to, class_name: 'Proposal'
  
  def should_generate_new_friendly_id?
    slug.blank?
  end
  
  def slug_candidates
    [
      :title,
      [:title, :user],
      [:title, :user, :id]
    ]
  end

end
