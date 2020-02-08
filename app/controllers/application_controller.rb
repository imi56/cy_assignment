class ApplicationController < ActionController::API
  def api
    render json: {
      message: "You discoved an API"
    }
  end

  def render_error(messages = [], status = :bad_request)
    render json: { messages: messages }, status: status
  end

  #  res => data, status, result, messages
  def render_success(data = {}, messages = ['Success'], status = :ok)
    render json: { data: data, messages: messages }, status: status
  end

end
