class ShmcookAltSerializer < ShmcookSerializer
  has_many :shmcookstatuses
  has_many :shmuserstatuses
  has_many :shmorders
end
