class PatternFile < ActiveRecord::Base
  validates :name, :pattern, presence: true

  has_attached_file :content
  belongs_to :pattern
end
