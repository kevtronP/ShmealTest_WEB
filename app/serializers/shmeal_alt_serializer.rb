class ShmealAltSerializer < ShmealSerializer
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  belongs_to :menuitem

  def menuitemattributes
    MenuitemAltSerializer.new(object.menuitem).shmshmealattributes
  end

end
