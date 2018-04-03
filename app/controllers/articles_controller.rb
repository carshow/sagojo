class ArticlesController < ApplicationController
  before_action :set_company, only: [:create, :new]
  before_action :set_tags, only: [:recommend, :latest, :popular, :wanted, :finished, :category]
  def index
    @articles = Article.order("created_at DESC").limit(5).includes(:company)
    @slider_articles = Article.order("created_at DESC").limit(3).includes(:company)
    @current_date = Date.current
  end

  def recommend
    @articles = Article.order("end_of_date DESC").page(params[:page]).per(10).includes(:company)

    @selected_articles = Article.order("end_of_date DESC")

  end

  def latest
     @articles = Article.order("created_at DESC").page(params[:page]).per(10).includes(:company)

     @selected_articles = Article.order("created_at DESC")

  end

  def popular
     @articles = Article.order("requested_number_of_people DESC").page(params[:page]).per(10).includes(:company)

     @selected_articles = Article.order("requested_number_of_people DESC")
  end

  def wanted
    today = Date.today
    @selected_articles = []
    @all_articles.each do |article|
      if article.end_of_date - today > 0
        @selected_articles << article
      end
      @articles = Kaminari.paginate_array(@selected_articles).page(params[:page]).per(10)
    end
  end

  def finished
    today = Date.today
    @selected_articles = []
    @all_articles.each do |article|
      if article.end_of_date - today < 0
        @selected_articles << article
      end

    @articles = Kaminari.paginate_array( @selected_articles ).page(params[:page]).per(10)
    end
  end

  def category
    @selected_tag = @all_tags.find(params[:id])
    @selected_articles = @all_articles.tagged_with( @selected_tag )
    @articles = Kaminari.paginate_array( @selected_articles ).page(params[:page]).per(10)
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
     :extra_comment,
     :category_list
    ).merge(company_id: current_company.id)
  end

  def set_company
    @company = Company.find_by(id: current_company.id)
  end

  def set_tags
    @all_tags = Article.all_tags
    @all_articles = Article.all
  end
end
