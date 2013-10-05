class Response

  def self.ok(message='')
    {success: {code: 1, message: message, status: 200}}
  end

  def self.unauthorized(message='')
    {error: {code: 2, message: message, status: 401}}
  end

  def self.bad_request(message='')
    {error: {code: 3, message: message, status: 400}}
  end

  def self.forbidden(message='')
    {error: {code: 4, message: message, status: 403}}
  end

  def self.not_found(message='')
    {error: {code: 5, message: message, status: 404}}
  end

  def self.unprocessable(message='')
    {error: {code: 6, message: message, status: 422}}
  end

end
