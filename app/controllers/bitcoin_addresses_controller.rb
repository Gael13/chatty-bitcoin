class BitcoinAddressesController < ApplicationController
  before_action :find_user

  def index
  	if Site.locked_to_owner?
  	  # Render page as normal
  	else
  	  redirect_to new_user_path
  	end
  end

  def new
  end

  def show
    @bitcoin_address = BitcoinAddress.find_by_id_alias!(params[:id])
  end
  
  def create
    @bitcoin_address = BitcoinAddress.generate
    @bitcoin_address.description = filtered_params(:bitcoin_address)[:description]

    if @bitcoin_address.save
      render "show"
    else
      render json: @bitcoin_address.errors, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.first
  end
  
  def allowed_params(context)
    %w{description}
  end
  
end            
