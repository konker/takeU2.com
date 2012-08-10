When /^I visit the homepage$/ do
  visit root_path
end

Then /^I should see the heading "(.*?)"$/ do |text|
  page.should have_selector("h1", :text => text)
end

