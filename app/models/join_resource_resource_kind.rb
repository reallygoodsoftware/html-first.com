class JoinResourceResourceKind < ApplicationRecord
  belongs_to :resource
  belongs_to :resource_kind
end
