class PatternFile < ActiveRecord::Base
  has_attached_file :content

  # validates_attachment_content_type(
  #   :content,
  #   content_type: ['application/pdf']
  # )

  belongs_to :pattern
end
