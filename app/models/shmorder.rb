class Shmorder < ApplicationRecord
  belongs_to :shmeal
  has_many :shmrequestattributes
  has_many :shmrequeststatuses
  has_many :shmorderfeedbacks
end
