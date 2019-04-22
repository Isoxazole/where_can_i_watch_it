class Comment < ActiveRecord::Base
  belongs_to :movie
  validates :author_name, presence: true
  validates :body, presence: true
end
