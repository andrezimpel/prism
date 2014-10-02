class Clients::GalleriesController < Clients::ClientsController
  before_action :set_gallery, only: [:show]

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = current_client.galleries
    @title = "My Galleries"
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @title = @gallery.title
    @shopping_cart_item = ShoppingCartItem.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, :account_id)
    end
end
