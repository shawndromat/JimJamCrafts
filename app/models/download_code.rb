class DownloadCode < ActiveRecord::Base
  validates :code, :pattern_id, :status, presence: true
  validates :code, uniqueness: true
  validates :status, inclusion: %w(PENDING SENT DISABLED)
  
  after_initialize :generate_code

  belongs_to :pattern

  default_scope { order(:created_at) }

  CHARS_TO_SUB = {
    /I/ => "i",
    /l/ => "L",
    /O/ => "0"
  }

  def self.unique_code
    code = nil
    loop do
      code = SecureRandom::urlsafe_base64(8)
      p code
      CHARS_TO_SUB.each do |regex, char|
        code = code.gsub(regex, char)
      end
      break unless DownloadCode.exists?(code: code)
    end

    code
  end

  private
  def generate_code
    self.code ||= self.class.unique_code
  end
end
