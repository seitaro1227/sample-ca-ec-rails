# Orderトランザクションで更新する
class TransactionOrder
  include Interactor::Organizer

  organize FindUser, CheckStock, UpdateStock, BuildOrder
end
