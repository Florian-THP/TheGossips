class GossipsController < ApplicationController
  before_action :authenticate_user
  def index
    @gossip = Gossip.all
    @tags = Tag.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end


  def new
    @gossip = Gossip.new
  end
  def create
    @gossip = Gossip.create(
      content: params["gossip_content"],
      title: params["gossip_title"],
      user_id: current_user.id
    ) # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to gossips_path, notice: "Gossip créé avec succès."
    else
     render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: "Potin bien mis à jour !"
    else
      render :edit
    end
  end
  def destroy
    @gossip = Gossip.find_by(id: params[:id])
    if current_user == @gossip.user
      @gossip.likes.destroy_all
      @gossip.comments.destroy_all
      @gossip.tags.destroy_all
      @gossip.destroy
      flash[:notice] = "Gossip supprimé avec succès."
      redirect_to gossips_path
    else
      flash[:danger] = "Vous n'avez pas le droit de supprimer ce potin."
      redirect_to gossips_path
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content) # Permet les attributs title et content
  end
end
