class ArticlesController < ApplicationController
  before_action :set_company, only: [:create, :new]
  before_action :set_tags, only: [:recommend, :latest, :popular, :wanted, :finished, :category]

  def index
    @articles = Article.order("created_at DESC").limit(5).includes(:company, :taggings)
    @slider_articles = Article.order("created_at DESC").limit(3).includes(:company, :taggings)
    @current_date = Date.current

    @new_sholabos = Sholabo.order("created_at DESC").limit(3)
    @popular_sholabos = Sholabo.order("id DESC").limit(3)
  end

  def recommend
    @articles = Article.order("end_of_date DESC").page(params[:page]).per(10).includes(:company, :taggings)

  end

  def latest
     @articles = Article.order("created_at DESC").page(params[:page]).per(10).includes(:company, :taggings)

  end

  def popular
     @articles = Article.order("requested_number_of_people DESC").page(params[:page]).per(10).includes(:company, :taggings)

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
    @articles = Article.limit(3).includes(:company, :taggings)
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_recommend_path
    else
      render :new
    end
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
    @all_articles = Article.all.includes(:company, :taggings)
  end
end
