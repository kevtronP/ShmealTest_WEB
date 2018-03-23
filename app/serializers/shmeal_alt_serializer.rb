class ShmealAltSerializer < ShmealSerializer
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  belongs_to :menuitem

  def shmealMenuItems

    Shmshmealattribute.where(:menuItemID => self.menuitem_id)

  end

end
