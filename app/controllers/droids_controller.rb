class DroidsController < ApplicationController
    
    get '/droids' do
        authenticate
        @droid = Droid.all
        erb :'/droids/droids'
    end

    get '/droids/new' do
        authenticate
        erb :'/droids/new'
    end

    post '/droids' do
        authenticate
        Droid.create(name: params[:name], colors: params[:colors], droid_model: params[:droid_model], user: current_user)
        redirect "/droids"
    end

    get '/droids/:id' do
        authenticate
        @droid = Droid.find_by(id: params[:id])
        erb :'/droids/show_droid'
    end

    get '/droids/:id/edit' do
        @droid = Droid.find_by(id: params[:id])
        authorize(@droid)
        erb :'/droids/edit_droid'
    end

    patch '/droids/:id' do
        @droid = Droid.find_by(params[:id])
        authorize(@droid)
        if @droid.update(name: params[:name], colors: params[:colors], droid_model: params[:droid_model])
            redirect "/droids"
        else
            redirect "/droids/#{@droid.id}/edit"
        end
    end

    delete '/droids/:id/delete' do
        @droid = Droid.find_by(params[:id])
        authorize(@droid)
        @droid.destroy
        redirect "/droids"
    end
end