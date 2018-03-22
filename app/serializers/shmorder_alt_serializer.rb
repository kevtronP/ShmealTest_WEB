class ShmorderAltSerializer < ShmorderSerializer
  has_many :shmrequestattributes
  has_many :shmrequeststatuses
  has_many :shmorderfeedbacks
end
