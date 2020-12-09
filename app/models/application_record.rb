class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def child_count(arg)
    self.send(arg).count
  end
end
