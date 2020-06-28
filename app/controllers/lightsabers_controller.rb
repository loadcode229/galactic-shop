class LightsabersController < ApplicationController

    get '/lightsabers' do
        authenticate
        @lightsabers = current_user.lightsabers
        erb :'/lightsabers/lightsabers'
    end

    get '/lightsabers/new' do
        authenticate
        erb :'/lightsabers/new'
    end

    post '/lightsabers' do
        authenticate
        Lightsaber.create(name: params[:name], color: params[:color], saber_type: params[:saber_type], saber_handle: params[:saber_handle], user: current_user)
        redirect "/lightsabers"
    end 

    get '/lightsabers/:id' do
        authenticate
        @lightsaber = Lightsaber.find_by(id: params[:id])
        erb :'/lightsabers/show_lightsaber'
    end

    get '/lightsabers/:id/edit' do
        @lightsaber = Lightsaber.find_by(id: params[:id])
        authorize(@lightsaber)
        erb :'/lightsabers/edit_lightsaber'
    end

    patch '/lightsabers/:id' do
        @lightsaber = Lightsaber.find_by(id: params[:id])
        authorize(@lightsaber)
        if @lightsaber.update(name: params[:name], color: params[:color], saber_type: params[:saber_type], saber_handle: params[:saber_handle])
            redirect "/lightsabers"
        else
            redirect "/lightsabers/#{@lightsaber.id}/edit"
        end
    end

    delete '/lightsabers/:id/delete' do
        @lightsaber = Lightsaber.find_by(params[:id])
        authorize(@lightsaber)
        @lightsaber.destroy
        redirect "/lightsabers"
    end
end