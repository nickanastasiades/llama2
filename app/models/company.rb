class Company < ApplicationRecord
  has_many :clients, :dependent => :destroy
end
