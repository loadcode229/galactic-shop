class Lightsaber < ActiveRecord::Base
    belongs_to :jedi
    has_one :user, through: :jedi

    validates :name, :color, :saber_type, :saber_handle, :jedi_id, presence: true
end