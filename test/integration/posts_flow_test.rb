require "test_helper"

class PostsFlowTest < ActionDispatch::IntegrationTest
  test "creating, editing, and deleting a post" do
    get new_post_url
    assert_response :success

    post posts_url, params: { post: { title: "Flow Test", description: "Testing full flow" } }
    follow_redirect!
    assert_response :success
    assert_select "h1", "Flow Test" # Asegúrate de que este texto coincida con el título en tu vista

    get edit_post_url(Post.last)
    patch post_url(Post.last), params: { post: { title: "Updated Flow Test" } }
    follow_redirect!
    assert_response :success
    assert_select "h1", "Updated Flow Test" # Verifica también aquí

    delete post_url(Post.last)
    follow_redirect!
    assert_response :success
    assert_select "h1", "Posts List"
  end
end
