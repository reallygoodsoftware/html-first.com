class ResourceKind < ApplicationRecord
  has_many :join_resource_resource_kinds
  has_many :resources, :through => :join_resource_resource_kinds
  validates_presence_of :name, :identifier
end
