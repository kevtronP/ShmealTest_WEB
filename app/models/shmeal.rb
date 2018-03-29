class Shmeal < ApplicationRecord
  #belongs_to :menuitem, polymorphic: true
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  has_many :shmorders
  belongs_to :menuitem
end
