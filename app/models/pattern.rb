class Pattern < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :pattern_files
  has_many :download_codes
end
