class ShmealAltSerializer < ShmealSerializer
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  belongs_to :menuitem, serializer: MenuitemAltSerializer

end
