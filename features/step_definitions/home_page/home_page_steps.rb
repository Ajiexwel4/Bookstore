Given(/^The user is logged in or a guest$/) do
end

Given(/^he is on the Home page$/) do
  visit home_path
end

Then(/^he can see books from the Mobile development category by default$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^he wants to change the category$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^he clicks the Home link in the top right corner$/) do
  find('.visible-xs ul.nav.navbar-nav').click_on('Home') ||
  find('.hidden-xs ul.nav.navbar-nav').click_on('Home')
end

Then(/^chooses a filter from the following options: Mobile development, Photo, Web design, Web development\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^respective sections are displayed for each category: Latest books, Get Started, Best sellers\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
