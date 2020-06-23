class UsersController < ApplicationController

    get '/signup' do
        erb :'users/create_user'
    end

    post '/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            #successful signup
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            #unsuccessful signup
            redirect "/users/signup"
        end
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            #successful login
            session[:user_id] = @user.id
            redirect "/"
        else
            #unsuccessful login
            @error = "Wrong Holocode!"
            erb :'users/login'
        end 
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end