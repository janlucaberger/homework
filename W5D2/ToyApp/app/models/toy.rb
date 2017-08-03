class Toy < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { scope: :toyable }

  belongs_to :toyable, polymorphic: true


end
