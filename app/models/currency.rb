# -*- coding: utf-8 -*-
class Currency < ActiveRecord::Base
  self.inheritance_column = nil
  validates :name, presence: true, length: {maximum:20}
  validates :symbol, presence: true, length: {maximum:6}
  validates :user_id, presence: true
  validates :type, presence: true, length: {maximum:32}
  has_many :accounts
  belongs_to :user

  # type => system, and will be fund later ?基金?
  # TODO set single table inheritance ?
end
