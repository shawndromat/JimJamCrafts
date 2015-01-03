json.extract! download_code, :order_number, :code
json.pattern do
  json.partial! 'api/patterns/pattern', pattern: download_code.pattern
end
