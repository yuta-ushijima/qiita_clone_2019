# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  user_id    :bigint
#  article_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
