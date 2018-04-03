class SholabosController < ApplicationController
  def index
    @articles = Article.order("end_of_date DESC").page(params[:page]).per(10).includes(:company, :taggings)
    @all_tags = Article.all_tags
    @all_articles = Article.all.includes(:company, :taggings)
  end

  def new
  end

  def create
  end

  def show
  end
end
