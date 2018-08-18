# require 'pg'
# require 'rubygems'
# require 'sinatra'
# require 'active_record' test

class User < ActiveRecord::Base
  def initialize(sender_id)
    @sender_id = sender_id
  end
# attr_accessor :id, :fb_id, :first_name

#   def self.all
#     db = PG.connect(dbname: ignilifeproject, user: 'kenza', password: 'ignilifeprojectacek')
#     users = Array.new
#     results = db.exec("SELECT * FROM users ORDER BY id")
#     results.each do |row|
#       user = self.new
#       user.id = row['id']
#       user.first_name = row['first_name']
#       users << user
#     end
#     users
#   end

#   def self.find(id)
#     db = PG.connect(dbname: ignilifeproject, user: 'kenza', password: 'ignilifeprojectacek')
#     results = db.exec_params("SELECT * FROM persons WHERE id = $1", [id]).first
#     return nil unless results
#     user = self.new
#     user.id = row['id']
#     user.first_name = row['first_name']
#     user
#   end

# #instance method so no self
#   def save
#     if @id == nil
#       insert_record
#     else
#       update_record
#     end
#   end

#   private

#   def insert_record
#     db = PG.connect(dbname: ignilifeproject, user: 'kenza', password: 'ignilifeprojectacek')
#     results = db.exec_params("INSERT INTO users (fb_id, first_name) VALUE ($1, $2) RETURNING id",
#       [fb_id, first_name ])
#     @id = results.first['id'].to_i if results.first['id']
#   end

#   def update_record
#     db.exec_params("UPDATE users SET fb_id = $2, first_name = $3 WHERE id = $1",
#       [id, fb_id, first_name])
#   end
end

