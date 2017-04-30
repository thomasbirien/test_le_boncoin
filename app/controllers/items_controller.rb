class ItemsController < ApplicationController
  def index
    if params[:category] == nil
      @items = Item.all
    else
      items_filter = ItemFilter.new(params)
      items_filter.filter
      @items = items_filter.items
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to profile_path
  end

  private
  def item_params
    params.require(:item).permit(:price, :category, :item_name, :description, :picture, :user_id)
  end
end

