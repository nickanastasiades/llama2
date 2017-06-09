class Project < ApplicationRecord
  validates :title, presence: true
  validates :project_type, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :version, presence: true
  has_many :items, :class_name => "Item", :foreign_key => "project_id"
  belongs_to :client, optional: true
  belongs_to :designer, optional: true
end
