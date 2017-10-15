class User < ApplicationRecord
  include Clearance::User
  has_many :notes
  has_many :snotes
end
