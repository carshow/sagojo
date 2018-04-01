class ArticlesController < ApplicationController
  before_action :set_company, only: [:create, :new]
  def index
    @articles = Article.order("created_at DESC").limit(5)
    @slider_articles = Article.order("created_at DESC").limit(3)
    @current_date = Date.current
  end

  def recommend
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.limit(2)
  end

  def beginner
  end

  def faq
  end

  def business
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path

  end

  private

  def article_params
    params.require(:article).permit(
     :text,
     :image,
     :comment,
     :price,
     :title,
     :overview,
     :qualification,
     :requested_number_of_people,
     :period,
     :destination,
     :image_of_person_in_charge,
     :end_of_date,
     :extra_comment
    ).merge(company_id: current_company.id)
  end

  def set_company
    @company = Company.find_by(id: current_company.id)
  end
end
