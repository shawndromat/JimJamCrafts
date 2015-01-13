class EtsyDecorator < SimpleDelegator
  attr_reader :etsy_content

  def initialize(etsy_content, path)
    @etsy_content = etsy_content
    @path = path
    super(etsy_content)
  end

  def path
    @path.split('/').map do |segment|
      if segment[0] == ":"
        etsy_content.send(segment[1..-1].to_sym)
      else
        segment
      end
    end.join('/')
  end

  def save
    update_image_url
    super
  end

  private

  def update_image_url
    if etsy_content.listing_id_changed?
      etsy_content.image_url = results.first["url_170x135"]
    end
  end

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
