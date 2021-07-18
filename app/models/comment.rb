# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  comment_post :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  post_id      :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord

    validates :comment_post, presence: true

    belongs_to(
        :post,
        class_name: 'Post',
        foreign_key: 'post_id',
        inverse_of: :comments
    )

    belongs_to(
        :commenter,
        class_name: 'User',
        foreign_key: 'user_id',         # This user_id is commenter
        inverse_of: :comments
    )

    has_many :reports, as: :reportable, dependent: :destroy          # reportable_id is post/comment id

end
