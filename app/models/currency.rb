# -*- coding: utf-8 -*-
class Currency < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:20}
  validates :symbol, presence: true, uniqueness: true, length: {maximum:6}
  validates :user_id, presence: true
  validates :type, presence: true, length: {maximum:32}
  has_many :accounts
  belongs_to :user

  # type => system, and 基金?
end
