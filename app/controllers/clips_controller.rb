class ClipsController < ApplicationController
  before_action :set_variables, only: [:create, :destroy]

  def create
    @clip = current_user.clips.new(article_id: @article.id)

    if @clip.save
      redirect_to root_path
    end
  end

  def destroy
    @clip = current_user.clips.find_by(article_id: @article.id)
     if @clip.destroy
      redirect_to root_path
    end

  end


  def set_variables
    @article = Article.find(params[:article_id])
  end
end
