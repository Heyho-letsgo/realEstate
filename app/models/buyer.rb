class Buyer < ActiveRecord::Base

  def self.search(search_room,search_bedroom)
    
      where("room LIKE ? and bedroom LIKE ?", "%#{search_room}%", "%#{search_bedroom}%")
    
    
    
  end

end
