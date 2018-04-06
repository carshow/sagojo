class SholabosController < ApplicationController
  before_action :set_tags, only: [:latest, :popular, :category]

  def latest
    @sholabos = Sholabo.order("created_at DESC").page(params[:page]).per(10).includes(:taggings)

  end


  def popular
    @sholabos = Sholabo.order("id DESC").page(params[:page]).per(10).includes(:taggings)
  end

  def new
    @sholabo = Sholabo.new
  end

  def create
    @sholabo = Sholabo.new(column_params)
    if @sholabo.save
      redirect_to sholabos_latest_path
    else
      render :new
    end

  end

  def show
    @sholabo = Sholabo.find(params[:id])
    @articles = Article.limit(3).includes(:company, :taggings)
    @sholabos = Sholabo.limit(4).includes(:taggings)
  end


  def category
    @selected_tag = @all_tags.find(params[:id])
    @selected_sholabos = @all_sholabos.tagged_with( @selected_tag )
    @sholabos = Kaminari.paginate_array( @selected_sholabos ).page(params[:page]).per(10)
  end

  private

  def column_params
    params.require(:sholabo).permit(
      :title,
      :image,
      :text,
      :writer_image,
      :writer,
      :comment,
      :tag_list
      )
  end

   def set_tags
    @all_tags = Sholabo.all_tags
    @all_sholabos = Sholabo.all.includes(:taggings)
  end
end
