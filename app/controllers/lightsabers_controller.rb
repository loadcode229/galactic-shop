class LightsabersController < ApplicationController

    get '/lightsabers' do
        authenticate
        @lightsabers = Lightsaber.all
        erb :'/lightsabers/lightsabers'
    end
end