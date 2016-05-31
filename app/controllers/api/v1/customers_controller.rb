class Api::V1::CustomersController < Api::ApiController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find

  end

  def find_all

  end

  def random

  end
end
