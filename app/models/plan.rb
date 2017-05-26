class Plan < ApplicationRecord
  has_many :subscriptions, :dependent => :destroy
  has_many :clients, :through => :subscriptions, :source => :client
end
