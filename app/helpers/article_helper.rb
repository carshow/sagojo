module ArticleHelper
  def deadline_for_article(deadline)
    today = Date.today
    period = deadline - today
    if period > 0
      return period.to_i
    else
      return 0
    end
  end
end
