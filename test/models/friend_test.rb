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
require "test_helper"

class FriendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
