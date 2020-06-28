class UsersController < ApplicationController

    get '/show' do
        authenticate
        @user = current_user
        erb :'/users/show'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        authorize_user(@user)
        erb :'/users/show'
    end

    get '/users/:id/edit' do
        @user = User.find_by(id: params[:id])
        authorize_user(@user)
        erb :'/users/edit'
    end

    patch '/users/:id' do
        @user = User.find_by(params[:id])
        authorize_user(@user)
        @user.update(username: params[:username], email: params[:email], password: params[:password])
        redirect "/show"
    end

    get '/signup' do
        erb :'users/create_user'
    end

    post '/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            #successful signup
            session[:user_id] = @user.id
            redirect "/login"
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
        if @user && @user.authenticate(params[:password])   #other authenticate - note
            #successful login
            session[:user_id] = @user.id
            redirect "/show"
        else
            #unsuccessful login
            @error = "Wrong Holocode!"
            erb :'users/login'
        end 
    end

    delete '/logout' do
        session.clear
        redirect "/"
    end
end