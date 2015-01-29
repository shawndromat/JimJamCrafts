class PatternFile < ActiveRecord::Base
  validates :name, :pattern, :filepicker_url, :filename, presence: true

  has_attached_file :content
  belongs_to :pattern
end
