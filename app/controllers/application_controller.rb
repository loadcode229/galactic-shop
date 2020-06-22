require './config/environment'

class ApplicationController < Sinatra::Base

    set :views, ->{ File.join(root, "../views") }
    enable :sessions
    set :session_secret, "password_security"

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
            redirect "/login" if !logged_in?
        end

        def authorize(lightsaber, droid)
            authenticate
            redirect "/lightsabers" if lightsaber.user != current_user
            redirect "/droids" if droid.user != current_user
        end
    end
end