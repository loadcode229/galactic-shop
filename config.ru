require './config/environment'


use Rack::MethodOverride
use DroidsController
use LightsabersController
use JedisController
use UsersController
run ApplicationController