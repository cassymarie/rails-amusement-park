class User < ActiveRecord::Base
    has_secure_password 
    has_many :rides
    has_many :attractions, through: :rides
    validates :name, presence: true
    validates :password, presence: true
    validates :height, presence: true

    def mood
        if self.nausea.nil? || self.happiness.nil?
            'blah'
        elsif self.nausea > self.happiness
            'sad'
        elsif  self.nausea <= self.happiness 
            'happy'
        else
            'content'
        end
    end
end
