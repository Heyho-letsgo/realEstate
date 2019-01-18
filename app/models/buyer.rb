class Buyer < ActiveRecord::Base
  
  validates :room, presence: true, length: { maximum: 2 }, :numericality => { greater_than: 0 }
  validates :bedroom, presence: true, length: { maximum: 2 }, :numericality => { greater_than: 0 }

  def self.search(search_room,search_bedroom)
    
    where("room LIKE ? AND bedroom LIKE ?", "#{search_room}", "#{search_bedroom}")
    
  end
end

