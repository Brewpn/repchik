class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
  	@shot = Shot.find(params[:shot_id])
  	@order = @shot.orders.create(comment_params) 
  	@order.user_id = current_user.id if current_user
  	@order.save!

  	redirect_to shot_path(@shot)

  end

  def destroy
  	@shot = Shot.find(params[:shot_id])
  	@order = @shot.orders.find(params[:id])
  	@order.destroy
  	redirect_to shot_path(@shot)
  end

  private

  def order_params 
  	params.require(:order).permit(:email)
  end
end
