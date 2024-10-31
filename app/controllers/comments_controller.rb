class CommentsController < ApplicationController
  before_action :set_gossip, only: [ :create, :show, :update, :destroy ]
  before_action :set_comment, only: [ :show, :update, :destroy ]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @gossip.comments.new(content: params[:comment_content], user_id: current_user.id)

    if @comment.save
      redirect_to gossip_path(@gossip), notice: "Commentaire ajouté avec succès."
    else
      redirect_to gossip_path(@gossip), alert: "Erreur lors de l'ajout du commentaire."
    end
  end

  def update
    if current_user == @comment.user && @comment.update(comment_params)
      redirect_to gossip_path(@gossip), notice: "Commentaire mis à jour avec succès !"
    else
      flash[:danger] = "Vous n'avez pas le droit de modifier ce commentaire."
      redirect_to gossip_path(@gossip)
    end
  end

  def destroy
    if current_user == @comment.user
      @comment.destroy
      flash[:notice] = "Commentaire supprimé avec succès."
      redirect_to gossip_path(@gossip)
    else
      flash[:danger] = "Vous n'avez pas le droit de supprimer ce commentaire."
      redirect_to gossip_path(@gossip)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id]) # Charge le potin avant de créer le commentaire
  end

  def set_comment
    @comment = Comment.find(params[:id]) # Charge le commentaire
  end
end
