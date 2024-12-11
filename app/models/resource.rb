class Resource < ApplicationRecord
  has_one_attached :image
  has_many :join_resource_resource_kinds
  has_many :resource_kinds, :through => :join_resource_resource_kinds
  has_many :join_tag_resources
  has_many :tags, through: :join_tag_resources

  accepts_nested_attributes_for :join_resource_resource_kinds
  accepts_nested_attributes_for :join_tag_resources

  def get_hypergist_content
    if is_hypergist?
      identifier = url.split("hypergist.localhost")[1].split("?")[0]
      raw_url = "http://hypergist.io/gists#{identifier}.md"
      response = HTTParty.get(raw_url)
    end
  end

  def is_hypergist?
    true if url.present? && url.include?("hypergist.local")
  end

  def is_snippet?
    true if is_hypergist?
  end
end
