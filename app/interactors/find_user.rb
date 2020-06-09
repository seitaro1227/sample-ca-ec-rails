# ユーザを探す
class FindUser
  include Interactor

  def call
    context.user = User.find(context.param_user_id)
  rescue
    context.fail!(message: 'ユーザが存在しない')
  end
end
