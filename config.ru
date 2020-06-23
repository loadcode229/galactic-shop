require './config/environment'


use Rack::MethodOverride
use LightsabersController
use JedisController
use UsersController
run ApplicationController