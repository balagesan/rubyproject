# clientcontroller
class ClientsController < ApplicationController
  before_action :set_client, only:[:show,:edit,:update,:destroy]
  def index
    @client = Client.all
    respond_to do |format|
      format.html
      format.json { render json: @client }
    end
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def show; end

  def create
    p '333333333333333333333333'
    p params.inspect
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      client_errors = @client.errors.full_messages
      flash[:notice] = client_errors
      render action: 'new'
    end
  end

  def update
    @client.update(client_params)
    redirect_to @client
  end

  def destroy
    @client.destroy
    redirect_to @client
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:organization_name,
                                   :email, :business_phone,
                                   :firstname, :lastname,
                                   :mobile, :available_credit_amount,
                                   :company, :country, :currency,
                                   :street_first, :street_second,
                                   :city, :state, :pincode, :industry,
                                   :companysize,
                                   :fax, :internal_notes,
                                   client_contacts_attributes:[:id,:client_id,:contact_email,:contact_name,:contact_phone,:contact_mobile,:_destroy])
  end
end
