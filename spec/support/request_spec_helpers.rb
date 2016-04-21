module RequestSpecHelpers
  def json_response
    JSON.parse(response.body)
  end

  def sign_in(user)
    post '/api/session', email: user.email, password: user.password
  end

  def sign_out
    delete '/api/session'
  end
end
