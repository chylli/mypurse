# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Currency.create([{ name: '人民币', abbr: 'RMB', symbol: '￥' },{ name: '美元', abbr: 'USD', symbol: '$'}])
I18n.locale = :zh
User.create!(name: 'testuser1', email: 'testuser1@example.com', password: 'password', password_confirmation: 'password',language: 'zh')
I18n.locale = :en
User.create!(name: 'testuser2', email: 'testuser2@example.com', password: 'password', password_confirmation: 'password',language: 'en')
