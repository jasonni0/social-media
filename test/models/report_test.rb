# == Schema Information
#
# Table name: reports
#
#  id              :bigint           not null, primary key
#  reason          :string
#  reportable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  reportable_id   :bigint           not null
#
# Indexes
#
#  index_reports_on_reportable  (reportable_type,reportable_id)
#
require "test_helper"

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
