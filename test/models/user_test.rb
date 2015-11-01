require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "users can upvote posts" do
    user = create_user("steve")
    post = Post.create!(
      title: "Test Post",
      body: "This is a test post.",
      user_id: user.id
    )
    user.upvote post

    assert_equal 1, post.vote_count
  end

  test "users can downvote posts" do
    user = create_user("steve")
    post = Post.create!(
      title: "Test Post",
      body: "This is a test post.",
      user_id: user.id
    )
    user.downvote post

    assert_equal -1, post.vote_count
  end

  test "user can reset votes" do
    
  end
end
