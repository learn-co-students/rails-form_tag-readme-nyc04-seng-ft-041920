require 'rails_helper'

describe 'new post' do
  it 'ensures that the form route works with the /new action' do
    visit new_post_path
    expect(page.status_code).to eq(200)
  end

  # Processing by PostsController#new as HTML ^^
  # Rendering posts/new.html.erb within layouts/application
  # Rendered posts/new.html.erb within layouts/application (0.3ms)
  # Completed 200 OK in 10ms (Views: 9.0ms | ActiveRecord: 0.0ms)

  it 'renders HTML in the /new template' do
    visit new_post_path
    expect(page).to have_content('Post Form')
  end

  it "displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
    visit new_post_path
    fill_in 'post_title', with: 'My post title'
    fill_in 'post_description', with: 'My post description'

    click_on 'Submit Post'

    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content('My post title')
    expect(page).to have_content('My post description')
  end
end
