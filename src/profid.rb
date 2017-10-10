#!/usr/bin/env ruby

require 'rugged' # https://github.com/libgit2/rugged

repo = Rugged::Repository.discover("./test/repo_test")

# List all branches
repo.references.each do |ref|
  puts ref.name
end
puts

walker = Rugged::Walker.new(repo)
walker.push(repo.head.target_id)
walker.sorting(Rugged::SORT_TOPO | Rugged::SORT_REVERSE)

# Log loops
walker.each { |c| puts c.inspect }

#puts head.log.each{|i| puts "id_old: #{i[:id_old]}
#id_new: #{i[:id_new]}
#committer:
#   name: #{i[:committer][:name]}
#  email: #{i[:committer][:email]}
#   time: #{i[:committer][:time]}
#"}

