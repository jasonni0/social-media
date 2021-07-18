# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :bigint
#  sender_id   :bigint
#
# Indexes
#
#  index_messages_on_receiver_id  (receiver_id)
#  index_messages_on_sender_id    (sender_id)
#
class Message < ApplicationRecord

    validates :content, presence: true

    belongs_to(
        :sender,
        class_name: 'User',
        foreign_key: 'sender_id',
        inverse_of: :receivers
    )

    belongs_to(
        :receiver,
        class_name: 'User',
        foreign_key: 'receiver_id',
        inverse_of: :senders
    )

end
