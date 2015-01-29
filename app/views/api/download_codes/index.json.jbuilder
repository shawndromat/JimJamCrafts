json.array! @download_codes do |code|
  json.extract! code, :id, :code, :order_number, :status
  json.pattern do 
    json.id code.pattern.id
    json.name code.pattern.name
  end
end
