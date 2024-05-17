class DogsController < ApplicationController
  def index
    dog_service = DogService.new
    @dog_breeds_name = dog_service.get_dog_breeds_name
  end

  def view
    @breed = params[:breed]
    dog_service = DogService.new(@breed)
    @dog_image = dog_service.get_dog_image
    respond_to do |format|
      format.turbo_stream
    end
  end
end
