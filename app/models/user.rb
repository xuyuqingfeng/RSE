require 'state_machine'

class User < ApplicationRecord
  after_initialize :set_state
  def set_state
    self.state = "prepare" if self.new_record?
  end

  state_machine :state, :initial => :prepare do
    event :on_submit do
      transition :prepare => :ongoing
    end

    event :on_finish do
      transition :ongoing => :stop
    end
  end
end
