class MenuitemAltSerializer < MenuitemSerializer
  has_many :shmeals
  has_many :shmmenuitemstatuses
  has_many :shmshmealattributes

  has_many :shmorders, through: :shmeals
  has_many :shmorderfeedbacks, through: :shmorders
  has_many :shmrequestattributes, through: :shmorders
  has_many :shmrequeststatuses, through: :shmorders

  belongs_to :user, serializer: UserAltSerializer
end
