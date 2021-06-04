class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_id, :price, :image).merge(user_id: current_user.id)
  end
end
