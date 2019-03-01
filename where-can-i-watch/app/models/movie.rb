class Movie < ActiveRecord::Base
  def self.all_ratings
    array = Array.new
    self.select("rating").uniq.each {|x| array.push(x.rating)}
    array.sort.uniq
  end
end
