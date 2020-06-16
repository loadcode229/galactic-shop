class Lightsaber < ActiveRecord::Base
    belongs_to :user
    validates :color, presence: true
    validates :saber_style, presence: true
    validates :saber_handle, presence: true
end