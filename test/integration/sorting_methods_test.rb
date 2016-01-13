require "test_helper"

class SortingMethodsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  fixtures :repos
  fixtures :doc_methods
  fixtures :doc_comments

  test 'sorting methods by documentation status' do
    visit '/'
    click_link 'rails'
    click_link 'Documented Methods'
    assert_not page.has_content?('ActiveRecord#undocumented')
    click_link 'Undocumented Methods'
    assert_not page.has_content?('ActiveRecord#documented')
  end

end
