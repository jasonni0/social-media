# == Schema Information
#
# Table name: friends
#
#  id           :bigint           not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requestee_id :bigint
#  requester_id :bigint
#
# Indexes
#
#  index_friends_on_requestee_id  (requestee_id)
#  index_friends_on_requester_id  (requester_id)
#
class Friend < ApplicationRecord

    validates :status, inclusion: { in: ['accepted', 'pending'] }
    validates :requester_id, uniqueness: { scope: :requestee_id }
    validates :requestee_id, uniqueness: { scope: :requester_id }

    belongs_to(
        :requester,
        class_name: 'User',
        foreign_key: 'requester_id',
        inverse_of: :requestees
    )

    belongs_to(
        :requestee,
        class_name: 'User',
        foreign_key: 'requestee_id',
        inverse_of: :requesters
    )

end
