require "pry"
class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
end

def valid?
  if sender.valid? == true && receiver.valid? == true
    true
  else
  false
  end
end

def execute_transaction
  if self.status == "complete"
    false
  elsif  self.sender.status == "closed" || self.sender.balance < self.amount
    self.status = "rejected"
    return "Transaction rejected.  Please check your account balance."
  else
    self.receiver.balance = self.receiver.balance + self.amount
    self.sender.balance = self.sender.balance - self.amount
    self.status = "complete"
  end
end
#binding.pry

end
