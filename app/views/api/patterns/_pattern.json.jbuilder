json.extract! pattern, :name, :id
json.pattern_files pattern.pattern_files, partial: 'api/pattern_files/pattern_file', as: :pattern_file
