class DogsController < ApplicationController
  def view
    breed = params[:breed]
    dog_service = DogService.new(breed)
    @dog_image = dog_service.get_dog_image
    respond_to do |format|
      format.turbo_stream
    end
  end
end
