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

   def sum_tags_articles(all_tags)
    sum = 0
    all_tags.each do |tag|
      sum += tag.taggings_count
    end
    return sum
  end
end
