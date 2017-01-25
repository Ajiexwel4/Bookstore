Given(/^he is at the Home page, Get Started$/) do
  visit root_url
end

When(/^he clicks the Get Started button$/) do
  click_on('Get Started')
end

Then(/^he will be transferred to the Catalog page\.$/) do
  expect(page).to have_content('Catalog')
end
