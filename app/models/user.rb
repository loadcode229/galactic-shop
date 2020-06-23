class User < ActiveRecord::Base
    has_secure_password
    has_many :jedis
    has_many :lightsabers, through: :jedis
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
end