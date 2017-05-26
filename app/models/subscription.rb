class Subscription < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :plan, optional: true
end
