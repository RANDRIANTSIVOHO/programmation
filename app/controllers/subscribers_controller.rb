class SubscribersController < ApplicationController
	before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
  def index
  	@subscriber = Subscriber.new
  end

  def create
  	@subscriber = Subscriber.new(subscriber_params)
  	if @subscriber.save
  		cookies[:saved_subscriber] = true
  		redirect_to root_path
  	else
  		redirect_to root_path, notice: "Failed to save"
  	end
  end

  private
  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end
  def subscriber_params
  	params.require(:subscriber).permit(:name, :email, :langage, :pays)
  end
end
