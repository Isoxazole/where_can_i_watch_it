#Movie.rb
class Movie < ActiveRecord::Base
  def self.all_ratings
    array = Array.new
    self.select("rating").uniq.each {|x| array.push(x.rating)}
    array.sort.uniq
  end

  def self.search(search)
    key = "%#{search}%"
    if search
      where('title LIKE ?', key)
    else
      all
    end
  end

end