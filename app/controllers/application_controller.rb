require './config/environment'

class ApplicationController < Sinatra::Base

    set :public_folder, Proc.new { File.join(root, "public") }
    set :views, ->{ File.join(root, "../views") }
    enable :sessions
    set :session_secret, "password_security"
    disable :show_exceptions

    get '/' do
        erb :index
    end

    self.helpers do

        def current_user
            User.find_by(id: session[:user_id])
        end

        def logged_in?
            !!current_user
        end

        def authenticate
            #redirect "/login" if !logged_in?
            raise AuthenticationError.new if !logged_in?
        end

        def authorize(jedi)
            authenticate
            #redirect "/jedis" if jedi.user != current_user
            raise AuthorizationError.new if jedi.user != current_user
        end

        def authorize_user(user)
            authenticate
            raise AuthorizationError.new if user != current_user
        end

        def render_navbar
            if logged_in?
                erb :logged_in_navbar
            else
                erb :logged_out_navbar
            end
        end
    end

    not_found do 
        status 404
        erb :not_found, layout: false
    end
    
    error AuthenticationError do 
        status 403
        erb :not_authenticated, layout: false
    end
    
    error AuthorizationError do 
        status 403
        erb :not_authorized, layout: false
    end
    
    error ActiveRecord::RecordNotFound do 
        status 404
        erb :not_found, layout: false
    end
end