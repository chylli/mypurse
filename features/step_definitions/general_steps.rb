When(/^I click the link '(.*)'$/) do |link_name|
  click_link link_name
end

Then(/^it will redirect to (.*)$/) do |page_name|
  expect(current_path).to eq(path_to(page_name))
end

Then(/^it will display '(.*)'$/) do |content|
  expect(page).to have_content(content)
end

Then(/^it will display the button '(.*)'$/) do |button_name|
  expect(page).to have_button(button_name)
end


Then(/^it will not display '(.*)'$/) do |content|
  expect(page).not_to have_content(content)
end

When(/^I visit (.*)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I click the '(.*)' button$/) do |button_name|
  click_button button_name
end

When(/^I fill the '(.*)' with '(.*)'/) do |field_name, field_value|
  fill_in field_name, with: field_value
end

When(/^I select the '(.*)' with '(.*)'/) do |field_name, field_value|
  select field_value, from: field_name
end

When(/^I go back$/) do
  #visit page.driver.request.env['HTTP_REFERER']
  page.evaluate_script('window.history.back()')
end

When(/^I wait for (\d+) seconds$/) do |n|
  sleep(n.to_i)
end
