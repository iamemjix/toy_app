class User < ApplicationRecord
    has_secure_password
    has_many :toys

    validates :email, :presence => true
end
