class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy
  belongs_to :company, optional: true
  has_many :items, :through => :projects, :source => :items
  has_many :plans, :through => :subscriptions, :source => :plan

end
