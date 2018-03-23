class ShmealAltSerializer < ShmealSerializer
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  belongs_to :menuitem

  def shmealMenuItems

    Shmshmealattribute.where(:menuItemID => :menuitem_id)

  end

end
