class JedisController < ApplicationController

    get '/jedis' do
        authenticate
        @jedis = current_user.jedis
        erb :'/jedis/jedis'
    end

    get '/jedis/new' do
        authenticate
        erb :'/jedis/new'
    end

    post '/jedis' do
        authenticate
        Jedi.create(name: params[:name], race: params[:race], home_planet: params[:home_planet], user: current_user)
        redirect "/jedis"
    end 

    get '/jedis/:id' do
        @jedi = Jedi.find_by(id: params[:id])
        authorize(@jedi)
        erb :'/jedis/show_jedi'
    end

    get '/jedis/:id/edit' do
        @jedi = Jedi.find_by(id: params[:id])
        authorize(@jedi)
        erb :'/jedis/edit_jedi'
    end

    patch '/jedis/:id' do
        @jedi = Jedi.find_by(params[:id])
        authorize(@jedi)
        if @jedi.update(name: params[:name], race: params[:race], home_planet: params[:home_planet])
            redirect "/jedis"
        else
            redirect "/jedis/#{@jedi.id}/edit"
        end
    end

    delete '/jedis/:id/delete' do
        @jedi = Jedi.find_by(params[:id])
        authorize(@jedi)
        @jedi.destroy
        redirect "/jedis"
    end
end