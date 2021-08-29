# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
class Topic < ApplicationRecord
  validates :name, presence: :true
  validates :image, presence: :true
  has_one_attached :image
end
