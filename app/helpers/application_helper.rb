module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "United States Open Music Competition"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def is_active?(options)
    "highlighted" if params.merge(options) == params
  end

  def decrypt(message)
    if message.length > 0
      encryption_key = ENV['ENCRYPTION_KEY']
      decrypted_message = AESCrypt.decrypt(message, encryption_key)
    else
      ''
    end
  end
end
