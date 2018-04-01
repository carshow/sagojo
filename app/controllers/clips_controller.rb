class ClipsController < ApplicationController
  before_action :set_variables, only: [:create, :destroy]

  def create
    @clip = current_user.clips.create(article_id: @article.id)

    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js
    end
  end

  def destroy
    @clip = current_user.clips.find_by(article_id: @article.id)
    @clip.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js
    end

  end


  def set_variables
    @article = Article.find(params[:article_id])
    @id_name = "#like-link-#{@article.id}"
    @star_name = "#star-#{@article.id}"
  end
end
