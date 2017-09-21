class Task < ApplicationRecord
  def complete!
    self.complete = true
    self.save
  end


end
