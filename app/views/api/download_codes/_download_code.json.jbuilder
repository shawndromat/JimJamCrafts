json.extract! download_code, :id, :order_number, :code, :status
json.pattern do
  json.partial! 'api/patterns/pattern', pattern: download_code.pattern
end
