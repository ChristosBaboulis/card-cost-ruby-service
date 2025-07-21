class BinlistService
  include HTTParty
  base_uri 'https://lookup.binlist.net'

  def get_card_info(card_number)
    response = self.class.get("/#{card_number}")
    if response.success?
      response.parsed_response
    else
      nil
    end
  rescue StandardError => e
    Rails.logger.error("Binlist API error: #{e.message}")
    nil
  end
end
