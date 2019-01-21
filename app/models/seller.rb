class Seller < ActiveRecord::Base

  validates :room, presence: true, length: { maximum: 2 }, :numericality => { greater_than: 0 }
  validates :bedroom, presence: true, length: { maximum: 2 }, :numericality => { greater_than: 0 }


def self.search(search_room,search_bedroom)
    if search_room.present? && search_bedroom.present?
      return where("room LIKE ? AND bedroom LIKE ?", "#{search_room}", "#{search_bedroom}")
    end
    if search_room.present?
      return   where("room LIKE ? ", "#{search_room}")
    end
    if search_bedroom.present?
      return  where("bedroom LIKE ? ", "#{search_bedroom}")
    end
    return Seller.all
end







end
