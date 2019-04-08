# frozen_string_literal: true

module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module HeadersHelpers
    # def api_header(version = 1)
    #   request.headers['Accept'] = "application/vnd.marketplace.v#{version}"
    # end

    def authenticated_header(request, user)
      token = JsonWebToken.encode(user_id: user.id)
      request.headers.merge!('Authorization': token.to_s)
    end

    # def api_response_format(format = Mime::JSON)
    #   request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
    #   request.headers['Content-Type'] = format.to_s
    # end

    def include_default_accept_headers
      # api_header
      # api_response_format
    end

    def confirm_and_login_user(user)
      post '/auth/login', params: { email: user.email, password: user.password }
      json['token']
    end
  end
end
