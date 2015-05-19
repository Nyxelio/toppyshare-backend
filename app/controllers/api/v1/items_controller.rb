class Api::V1::ItemsController < Api::V1::BaseController

  def create
    @top = Top.find(params[:top_id])
    @item = @top.items.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title)
  end
end
