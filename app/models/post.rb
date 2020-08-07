class Post < ApplicationRecord
    belongs_to :user
    has_many :photos, dependent: :destroy

    has_many :like, -> { order(created_at: :desc) }, dependent: :destroy

    accepts_nested_attributes_for :photos
    def liked_by(user)
        Like.find_by(user_id: user.id, post_id: id)
    end

    has_many :comments
end
