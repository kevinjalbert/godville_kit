module GodvilleKit
  class APIRequester
    attr_reader :username,
                :password,
                :hero_guid,
                :pantheons_guid

    class UnexpectedResponseException < StandardError; end
    class InvalidAuthenticationException < StandardError; end
    class AuthenticationCaptchaException < StandardError; end

    def initialize(username, password, hero_guid, pantheons_guid)
      @username = username
      @password = password
      @hero_guid = hero_guid
      @pantheons_guid = pantheons_guid
    end

    def request_hero
      authenticate
      GodvilleKit::Hero.new(request_raw_hero_data, request_raw_pantheons_data)
    end

    def authenticate
      return if authenticated?

      RestClient.post(
        'https://godvillegame.com/login/login',
        { username: @username,
          password: @password },
        content_type: :json, accept: :json
      )do |response, request, result, &block|
        case response.code
        when 302
          @cookies = response.cookies
        when 200
          if response.to_s.include? 'captcha'
            raise AuthenticationCaptchaException, 'Too many failed logins, manual login required due to captcha'
          else
            raise InvalidAuthenticationException, 'Invalid Username/Password'
          end
        else
          raise UnexpectedResponseCodeException, "Unexpected response code #{response.code}"
        end
      end
    rescue => e
      @cookies = nil
      puts e.message
    end

    def authenticated?
      !@cookies.nil?
    end

    # Request the raw hero data from godville
    def request_raw_hero_data
      return unless authenticated?

      response = RestClient.get(
        "https://godvillegame.com/fbh/feed?a=#{@hero_guid}",
        cookies: @cookies, content_type: :json, accept: :json
      )
      JSON.parse(response)
    end

    # Request the raw pantheons data from godville
    def request_raw_pantheons_data
      return unless authenticated?

      response = RestClient.get(
        "https://godvillegame.com/fbh/feed?a=#{@pantheons_guid}",
        cookies: @cookies, content_type: :json, accept: :json
      )
      JSON.parse(response)
    end
  end
end
