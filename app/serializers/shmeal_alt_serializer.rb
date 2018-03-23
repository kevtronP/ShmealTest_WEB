class ShmealAltSerializer < ShmealSerializer
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  has_one :menuitem
end
