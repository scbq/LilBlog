require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new(description: "A valid description")
    assert_not post.save, "Saved the post without a title"
  end

  test "should save post with valid title and description" do
    post = Post.new(title: "A valid title", description: "A valid description")
    assert post.save, "Failed to save the post with valid title and description"
  end
end
