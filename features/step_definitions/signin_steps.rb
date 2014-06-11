Given(/^a user named (\w+)$/) do |username|
  create(username)
end

When(/^I signin with (\w+)'s email and (\w+)'s password$/) do |username1, username2|
  user1 = build(username1)
  user2 = build(username2)
  step "I visit the signin page"
  fill_in "Email", :with => user1.email
  fill_in "Password", :with => user2.password
  click_button "Signin"
end

