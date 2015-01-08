class DownloadCode < ActiveRecord::Base
  validates :code, :pattern_id, presence: true
  validates :code, uniqueness: true
  
  after_initialize :generate_code

  belongs_to :pattern

  def self.unique_code
    code = nil
    loop do
      code = SecureRandom::urlsafe_base64(8)
      break unless DownloadCode.exists?(code: code)
    end

    code
  end

  private
  def generate_code
    self.code ||= self.class.unique_code
  end
end
