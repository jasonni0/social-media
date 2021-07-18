# == Schema Information
#
# Table name: guidelines
#
#  id         :bigint           not null, primary key
#  guideline  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Guideline < ApplicationRecord

    validates :guideline, presence: true

end
