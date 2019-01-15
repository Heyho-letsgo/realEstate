class Buyer < ActiveRecord::Base

def self.search(room)
  if room
    where('room LIKE ?', "%#{room}%")
  else
    "/buyers"
  end
end



end
