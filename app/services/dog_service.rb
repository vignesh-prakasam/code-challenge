class DogService
  API_URL = "https://dog.ceo/api/breed/%{breed}/images/random"

  def initialize(breed)
    @api_url = API_URL % {breed: breed}
  end

  def get_dog_image
    begin
      response = RestClient.get(@api_url)
      puts response.code
      return nil unless response.code == 200

      body = JSON.parse(response.body)
      body['message']
    rescue => exception
      nil
    end
  end

end
