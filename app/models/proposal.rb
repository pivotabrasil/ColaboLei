class Proposal < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
end
