# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  description :string
#  dislikes    :integer          default(0)
#  likes       :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord

    validates :title, :description, presence: true

    belongs_to(
        :creator,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
    )

    has_many(
        :comments,
        class_name: 'Comment',
        foreign_key: 'post_id',
        inverse_of: :post,
        dependent: :destroy
    )

    has_many(
        :reacts,
        class_name: 'React',
        foreign_key: 'post_id',
        inverse_of: :post,
        dependent: :destroy
    )

    has_many :reports, as: :reportable, dependent: :destroy          # reportable_id is post/comment id

end
