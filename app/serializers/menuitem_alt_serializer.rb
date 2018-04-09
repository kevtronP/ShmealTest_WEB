class MenuitemAltSerializer < MenuitemSerializer
  has_many :shmeals
  has_many :shmmenuitemstatuses
  has_many :shmshmealattributes
  belongs_to :user
  has_many :shmuserattributes, through: :user
end
