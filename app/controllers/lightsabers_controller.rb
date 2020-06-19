class LightsabersController < ApplicationController

    get '/lightsabers' do
        authenticate
        @lightsabers = Lightsaber.all
        erb :'/lightsabers/lightsabers'
    end

    get '/lightsabers/new' do
        authenticate
        erb :'/lightsabers/new'
    end

    post '/lightsabers' do
        authenticate
        Lightsaber.create(name: params[:name], user: current_user)
        redirect "/lightsabers"
    end 

    get '/lightsabers/:id' do
        @lightsaber = Lightsaber.find_by(params[:id])
        authorize(@lightsaber)
        erb :'/lightsabers/show_lightsaber'
    end

    get '/lightsabers/:id/edit' do
        @lightsaber = Lightsaber.find_by(params[:id])
        authorize(@lightsaber)
        erb :'/lightsabers/edit_lightsaber'
    end

    patch '/lightsabers/:id' do
        @lightsaber = Lightsaber.find(params[:id])
        authorize(@lightsaber)
        @lightsaber.update(color: params[:color], saber_style: params[:saber_style], saber_handle: params[:saber_handle])
        erb :'/lightsabers'
    end

    delete '/lightsabers/:id/delete' do
        @lightsaber = Lightsaber.find_by(params[:id])
        authorize(@lightsaber)
        @lightsaber.destroy
        redirect "/lightsabers"
    end
end