require 'addressable/uri'

class Pattern < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :pattern_files, dependent: :destroy
  has_many :download_codes, dependent: :destroy

  belongs_to :content, polymorphic: true
end
