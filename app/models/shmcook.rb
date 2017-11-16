class Shmcook < ApplicationRecord
  belongs_to :user
  has_many :shmcookstatuses
  has_many :shmuserstatuses
  has_many :shmconversations
  has_many :shmorders
end
