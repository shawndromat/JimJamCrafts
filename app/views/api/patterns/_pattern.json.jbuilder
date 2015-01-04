json.extract! pattern, :name, :id, :listing_id, :image_url
json.pattern_files pattern.pattern_files, partial: 'api/pattern_files/pattern_file', as: :pattern_file
