class Shmconversation < ApplicationRecord
  belongs_to :user
  belongs_to :shmcook
  has_many :shmorders
end
