class Project < ApplicationRecord
  belongs_to :client
  belongs_to :designer
  has_many :items, :dependent => :destroy
end
