class Response < ActiveRecord::Base

  def to_json
    if success
      {success: {code: code, message: message, status: status}}
    else
      {error: {code: code, message: message, status: status}}
    end
  end

  def self.ok(message='')
    self.new(code: 1, message: message, status: 200, success: true).to_json
  end

  def self.unauthorized(message='')
    self.new(code: 2, message: message, status: 401, success: false).to_json
  end

  def self.bad_request(message='')
    self.new(code: 3, message: message, status: 400, success: false).to_json
  end

  def self.forbidden(message='')
    self.new(code: 4, message: message, status: 403, success: false).to_json
  end

  def self.not_found(message='')
    self.new(code: 5, message: message, status: 404, success: false).to_json
  end

  def self.unprocessable(message='')
    self.new(code: 6, message: message, status: 422, success: false).to_json
  end

end
