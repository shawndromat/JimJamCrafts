class EtsyDecorator
  attr_reader :etsy_pattern, :path

  def initialize(etsy_pattern, path)
    @etsy_pattern = etsy_pattern
    @path = path
  end

  def save
    etsy_pattern.save
  end

  def update_image_url
    if results
      etsy_pattern.image_url = results.first["url_170x135"]
    else
      etsy_pattern.image_url = "images/no_image.jpg"
    end
  end

  private

  def etsy_uri
    Addressable::URI.new({
      scheme: "https",
      host: "openapi.etsy.com",
      path: path,
      query: "api_key=#{ENV['ETSY_API_KEY']}"
    })
  end

  def results
    @_results ||= HTTParty.get(etsy_uri.to_s).parsed_response["results"]
  end
end
