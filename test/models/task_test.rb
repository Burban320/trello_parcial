require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   test "the a task requires title" do
    task=Task.new
    
    assert !task.save, "The task was saved without title"
    
    #puts "--Errors--"
    #task.errors.full_messages.each {|msg| puts msg}
   end
   
end
