class Buyer < ActiveRecord::Base
  
  validates :room, presence: true, length: { maximum: 2 }, numericality: true
  validates :bedroom, presence: true, length: { maximum: 2 }, numericality: true

  def self.search(search_room,search_bedroom)
    
         where("room LIKE ? and bedroom LIKE ?", "%#{search_room}%", "%#{search_bedroom}%")
  end
end
