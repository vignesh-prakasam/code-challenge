class DogService
  API_URL = "https://dog.ceo/api/breed/%{breed}/images/random"
  BREEDS_URL = 'https://dog.ceo/api/breeds/list/all'
  def initialize(breed = nil)
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

  def get_dog_breeds_name
    begin
      response = RestClient.get(BREEDS_URL)
      return nil unless response.code == 200

      body = JSON.parse(response.body)
      body['message'].keys
    rescue => exception
      nil
    end
  end

end
