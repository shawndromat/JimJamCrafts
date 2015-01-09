json.extract! pattern, :name, :id
json.partial! pattern.content
json.pattern_files pattern.pattern_files, partial: 'api/pattern_files/pattern_file', as: :pattern_file
