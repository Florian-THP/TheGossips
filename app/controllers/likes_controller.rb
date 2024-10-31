class LikesController < ApplicationController
  before_action :set_gossip

  def create
    @like = @gossip.likes.new(user: current_user)

    if @like.save
      respond_to do |format|
        format.html do
          # Redirection vers la page d'origine après le like
          if request.referer&.include?(gossip_path(@gossip))
            redirect_to gossip_path(@gossip) # Reste sur la page de show du potin
          elsif request.referer&.include?("http://127.0.0.1:3000/city/cityview/")
            redirect_to "/city/cityview/#{@gossip.user.city.id}"
          else
            redirect_to gossips_path # Sinon redirige vers la page d'index
          end
        end
        format.json { render json: { likes_count: @gossip.likes.count, liked: true } }
      end
    else
      respond_to do |format|
        format.html { redirect_to gossips_path, alert: "Unable to like the gossip." }
        format.json { render json: { error: "Unable to like the gossip." }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = @gossip.likes.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.html do
        # Redirection vers la page d'origine après le unlike
        if request.referer&.include?(gossip_path(@gossip))
          redirect_to gossip_path(@gossip) # Reste sur la page de show du potin
        elsif request.referer&.include?("http://127.0.0.1:3000/city/cityview/")
          redirect_to "/city/cityview/#{@gossip.user.city.id}"
        else
          redirect_to gossips_path # Sinon redirige vers la page d'index
        end
      end
      format.json { render json: { likes_count: @gossip.likes.count, liked: false } }
    end
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
end
