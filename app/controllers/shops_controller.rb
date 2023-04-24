class ShopsController < ApplicationController
  before_action :set_shops, only: [:show]

  def index
    @shops = Shop.all
    if params[:query].present? && params[:query] == 'oui'
        @shops = @shops.order(name: :asc)
    end
    respond_to do |format|
      format.html #flow rails classique
      format.text { render partial: 'list', locals: { shops: @shops }, formats: :html}
      # il faut ajouter l'option formats pour que la partial au format html soit trouvée,
      # sinon par défaut ça renvoit le même format que la requete cad text )
    end
  end

  def show
    @schedules = Schedule.sort_schedules(@shop.schedules)
    if @schedules.present?
      respond_to do |format|
        format.html
        format.json { render json: @schedules, status: 200 }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: "This shop has no schedule yet", status: 404 }
      end
    end
  end

  private

  def set_shops
    @shop = Shop.find(params[:id])
  end
end
