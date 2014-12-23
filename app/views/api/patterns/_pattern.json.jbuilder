json.extract! pattern, :name, :id, :etsy_url
json.files pattern.files, partial: 'api/pattern_files/pattern_file', as: :pattern_file
