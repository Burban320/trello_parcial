require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  
   test "the a author requires an email and password" do
    author=Author.new
    
    assert !author.save, "The author was saved without email and password"
    
    #puts "--Errors--"
    #author.errors.full_messages.each {|msg| puts msg}
   end
   
   test "the a author has a unique email" do
    author=Author.new
    author.email = authors(:one).email
    
    assert !author.save, "The author was saved with a repeated password"
    
    #puts "--Errors--"
    #author.errors.full_messages.each {|msg| puts msg}
   end
   
   test "the a author requires a first_name and last_name" do
    author=Author.new
    author.email = "juanperez@gmail.com"
    author.password="12345678"
    
    assert !author.save, "The author was saved without first_name and last_name"
    
    #puts "--Errors--"
    #author.errors.full_messages.each {|msg| puts msg}
   end   
   
end
