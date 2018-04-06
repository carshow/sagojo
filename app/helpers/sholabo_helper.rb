module SholaboHelper
  def set_new_label(sholabo)
    # 1週間の間
    if Time.now - sholabo.created_at < 604800
      return true
    else
      return false
    end
  end
end
