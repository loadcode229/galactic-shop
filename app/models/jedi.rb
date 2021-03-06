class Jedi < ActiveRecord::Base
    belongs_to :user

    validates :name, presence: true
    validates :name, uniqueness: true

    def slug
        self.name.downcase.tr(" ","-")
    end 

    def self.find_by_slug(slug)
        Jedi.all.detect {|x| slug == x.slug}
    end
end