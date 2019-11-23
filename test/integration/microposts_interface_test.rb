require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    # 無効な送信
    # 有効な送信
    content = "This micropost really ties the room together"
    prefecture_code = 29
    picture = fixture_file_upload('test/fixtures/rails.png', 'image/png')
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content,
        picture:picture, prefecture_code: prefecture_code} }
    end
    assert assigns(:micropost).picture?
    assert_equal prefecture_code, assigns(:micropost).prefecture_code
    assert_redirected_to root_url
    follow_redirect!
    # 投稿を削除する
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

end
