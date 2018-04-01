class UsersController < ApplicationController
  def terms_of_service
  end

  def privacy
  end

  def rules
  end

  def identify
  end

  def favorite_list
    @clips = Clip.where(user_id: current_user.id).all
  end
end
