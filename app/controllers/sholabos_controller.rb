class SholabosController < ApplicationController

  def latest
    @sholabos = Sholabo.order("created_at DESC").page(params[:page]).per(10).includes(:taggings)
    @all_tags = Article.all_tags
    @all_sholabos = Sholabo.all
  end


  def popular
    @sholabos = Sholabo.order("id DESC").page(params[:page]).per(10).includes(:taggings)
    @all_tags = Article.all_tags
    @all_sholabos = Sholabo.all
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
end
