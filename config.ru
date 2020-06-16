require './config/environment'


use Rack::MethodOverride
use LightsabersController
use UsersController
run ApplicationController