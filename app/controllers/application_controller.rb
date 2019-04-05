class ApplicationController < ActionController::API
  
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToKen.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => begin
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecordError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
