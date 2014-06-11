When(/^I click the '(.*)' link$/) do |link_name|
  click_link link_name
end

Then(/^it will redirect to (.*)$/) do |page_name|
  expect(current_path).to eq(path_to(page_name))
end

Then(/^it will display '(.*)'$/) do |content|
  expect(page).to have_content(content)
end

Then(/^it will not display '(.*)'$/) do |content|
  expect(page).not_to have_content(content)
end

When(/^I visit (.*)$/) do |page_name|
  visit path_to(page_name)
end
