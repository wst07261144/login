class SessionController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def new
    if params[:open_id].present?
      user = User.find_by(open_id: params[:open_id])
      if user.present?
        session[:user_id] = user.id
        redirect_to ('/users/' + user.id.to_s)
      else
        cookies[:open_id] = params[:open_id]
      end
    end
  end

  def create
    user = User.find_by(params[:user])
    user_id = user.present? ? user.id : nil
    if user.present?
      session[:user_id] = user.id
      user.update(open_id: cookies[:open_id])
    end
    render json: {user_id: user_id}
  end

  def logout
    session[:user_id] = nil
    render text:'ok'
  end
end
