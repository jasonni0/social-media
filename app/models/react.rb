# == Schema Information
#
# Table name: reacts
#
#  id         :bigint           not null, primary key
#  is_like    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_reacts_on_post_id  (post_id)
#  index_reacts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class React < ApplicationRecord

    validates :is_like, inclusion: { in: [true, false] }
    validates :user_id, uniqueness: { scope: :post_id }

    belongs_to(
        :reacter,
        class_name: 'User',
        foreign_key: 'user_id',                  # This user_id is reacter
        inverse_of: :reacts
    )

    belongs_to(
        :post,
        class_name: 'Post',
        foreign_key: 'post_id',
        inverse_of: :reacts
    )

end
