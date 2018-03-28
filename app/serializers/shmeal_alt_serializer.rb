class ShmealAltSerializer < ShmealSerializer
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  belongs_to :menuitem

  def menuitem
    MenuitemAltSerializer.new(object.menuitem).attributes
  end

end
