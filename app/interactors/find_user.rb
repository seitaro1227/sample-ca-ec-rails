# ユーザを探す
class FindUser
  include Interactor

  def call
    context.user = User.find(context.user_id)
  rescue
    context.fail!(message: 'ユーザが存在しない')
  end
end
