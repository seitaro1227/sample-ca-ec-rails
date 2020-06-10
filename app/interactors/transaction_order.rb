# Orderトランザクションで更新する
class TransactionOrder
  include Interactor::Organizer

  organize FindUser, FindProducts, CheckStock, BuildOrder
end
