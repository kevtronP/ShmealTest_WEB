class Shmeal < ApplicationRecord
  #belongs_to :menuitem, polymorphic: true
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  has_many :shmorders
  has_one :menuitem
end
