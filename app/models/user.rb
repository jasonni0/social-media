# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  is_admin               :boolean          default(FALSE)
#  is_public              :boolean          default(FALSE)
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /[a-zA-Z]/ }

  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: 'user_id',
    inverse_of: :creator,
    dependent: :destroy
  )

  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: 'user_id',         # This user_id is commenter
    inverse_of: :commenter,
    dependent: :destroy
  )

  has_many(
    :reacts,
    class_name: 'React',
    foreign_key: 'user_id',         # This user_id is reacter
    inverse_of: :reacter,
    dependent: :destroy
  )

  has_many(
    :requestees,
    class_name: 'Friend',
    foreign_key: 'requester_id',
    inverse_of: :requester,
    dependent: :destroy
  )

  has_many(
    :requesters,
    class_name: 'Friend',
    foreign_key: 'requestee_id',
    inverse_of: :requestee,
    dependent: :destroy
  )

  has_many(
    :receivers,
    class_name: 'Message',
    foreign_key: 'sender_id',
    inverse_of: :sender,
    dependent: :destroy
  )

  has_many(
    :senders,
    class_name: 'Message',
    foreign_key: 'receiver_id',
    inverse_of: :receiver,
    dependent: :destroy
  )

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
