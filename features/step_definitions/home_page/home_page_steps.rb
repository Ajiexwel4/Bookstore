Given(/^The user is logged in or a guest$/) do
end

Given(/^he is on the Home page$/) do
  visit root_url
end

Then(/^he can see books from the Mobile development category by default$/) do
end

When(/^he wants to change the category$/) do
  expect(page).to have_content('Home')
end

Then(/^he clicks the Home link in the top right corner$/) do
  find('.hidden-xs ul.nav.navbar-nav li.dropdown').click_on('Home')
end

Then(/^chooses a filter from the following options: Mobile development, Photo, Web design, Web development\.$/) do
  expect(page).to have_content('Mobile developmen')
  expect(page).to have_content('Photo')
  expect(page).to have_content('Web design')
  expect(page).to have_content('Web development')
  find('ul.dropdown-menu').click_on('Photo')
end

Then(/^respective sections are displayed for each category: Latest books, Get Started, Best sellers\.$/) do
  expect(page).to have_content('Latest books')
  expect(page).to have_content('Get Started')
  expect(page).to have_content('Best sellers')
end
