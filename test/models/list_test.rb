require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_list
    List.create(id: 1, title: "Yo", archived?: false)
  end
  def test_user
    u = User.create(id: 1, username: "Yo", password: "yo", password_confirmation: "yo")
    u.lists << test_list
  end
  test 'it has tasks' do
    test_user
    assert_equal test_list.tasks, []
  end

  test 'it has a user' do
    test_user
    assert_equal test_list.user, []
  end
end
