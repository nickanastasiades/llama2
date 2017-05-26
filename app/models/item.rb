class Item < ApplicationRecord
  belongs_to :project
  has_one :client, :through => :project, :source => :client
  has_one :designer, :through => :project, :source => :designer
end
