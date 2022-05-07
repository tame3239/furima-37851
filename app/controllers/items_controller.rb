class ItemsController < ApplicationController
 
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :item_condition_id, :payer_id, :prefectures_id, :waiting_days_id, :price, :image).merge(user_id: current_user.id)
  end

end
