class Shmconversation < ApplicationRecord
  belongs_to :user
  has_many :shmorders
end
