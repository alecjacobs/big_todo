class Task < ActiveRecord::Base
  attr_accessible :description, :title, :completed
  after_initialize :completed => false
end
