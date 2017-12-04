class ApplicationController < ActionController::API

  def issue_token(payload)
    JWT.encode(payload, 'supersecretcode')
  end

  def grab_token_from_request
    request.headers["Authorization"] ?
    request.headers["Authorization"].split(" ")[1] :
    nil
  end

  def decode_token(token)
    begin
      JWT.decode(token, 'supersecretcode')
    rescue JWT::DecodeError
      []
    end
  end

  def decoded_token
    if grab_token_from_request
      decode_token(grab_token_from_request)
    else
      []
    end
  end

  def current_employee
    if !decoded_token.empty?
      employee_id = decode_token[0]['employee_id']
      Employee.find(employee_id)
    else
      nil
    end
  end

  def logged_in?
    !!current_employee
  end

  def authorized
    render json: {message: "Fail"} unless logged_in?
  end



end
