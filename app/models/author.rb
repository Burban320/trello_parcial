class Author < ActiveRecord::Base
    has_many :tasks
end
