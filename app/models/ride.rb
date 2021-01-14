class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        user = self.user
        ride = self.attraction
        
        if user.tickets < ride.tickets && user.height < ride.min_height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." 
        end 
        return "Sorry. You do not have enough tickets to ride the #{ride.name}." unless user.tickets >= ride.tickets
        return "Sorry. You are not tall enough to ride the #{ride.name}." unless user.height >= ride.min_height
        

        user.tickets -= ride.tickets
        user.happiness += ride.happiness_rating
        user.nausea += ride.nausea_rating
    end
end
