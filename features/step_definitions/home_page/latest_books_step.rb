Given(/^he is at the Home page, Latest books$/) do
  visit root_url
end

When(/^the user wants to flip the slide$/) do
end

Then(/^he clicks on it$/) do
  click_on('.item.active')
end

Then(/^the next slide is shown\.$/) do
end

When(/^he wants to add an item to the Cart$/) do
  expect(page).to have_content('Buy now')
end

Then(/^he clicks the Buy Now button and the chosen item will be added to the cart\.$/) do
  click_on('Buy now')
end
