# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  body        :text(65535)
#  post_status :string(255)      default("draft"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#

class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :post_status
end
