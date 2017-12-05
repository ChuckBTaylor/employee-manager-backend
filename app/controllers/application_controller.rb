class ApplicationController < ActionController::API


  def login # post user data, sends back jwt token and user info
    # @user = User.find_by(name: user_params['name'])
    employee = Employee.where('lower(name) = ?', params[:application][:name].downcase).first # we don't have params[:id] so we can't search by id or use the show action
    if !employee
      return render json: {errors: "No employee found", message: "Can't find an employee with the name #{params[:application][:name]}"}
    end
    if employee.authenticate(params[:application][:password])
      render json: {
        user: employee,
        jwt_token: issue_token({user_id: employee.id, company_id: employee.company_id}),
        message: "Success"
      }
    else
      render json: {message: 'Password was incorrect', errors: employee.errors.full_messages}, status: 400
    end
  end

  private

  def issue_token(payload)
    JWT.encode(payload, supersecretcode)
  end

  def grab_token_from_request
    request.headers["Authorization"] ?
    request.headers["Authorization"].split(" ")[1] :
    nil
  end

  def decode_token(token)
    begin
      JWT.decode(token, supersecretcode)
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

  def supersecretcode
    return 'supererseretcode'
  end

  def algorithm
    'RS256'
  end



end
