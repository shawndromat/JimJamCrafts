class Pattern < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false}

  has_many :pattern_files, class_name: "PatternFile"
end
