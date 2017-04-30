class ItemFilter
  attr_reader :params, :items

  def initialize(params)
    @params = params
    @items = Item.all
  end

  def filter
    if params[:min_price].empty? && params[:max_price].empty?
      params[:min_price] = 0
      params[:max_price] = 999999999999
    end
    filter_by_min_price
    filter_by_max_price
    filter_by_category
    filter_by_item_name
    @items = @items.distinct
    order_by_price
  end

  private

  def order_by_price
    if params[:price].present?
      @items = @items.order(price: :asc)
    end
  end

  def filter_by_min_price
    @items = @items.where('price >= ?', "#{params[:min_price]}")
  end

  def filter_by_max_price
    @items = @items.where('price <= ?', "#{params[:max_price]}")
  end

  def filter_by_category
    @items = @items.where('category LIKE ?', "#{params[:category]}")
  end

  def filter_by_item_name
    @items = @items.where('item_name LIKE ?', "%#{params[:item_name]}%")
  end
end

