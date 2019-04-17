#Movie.rb
class Movie < ActiveRecord::Base
  has_many :comments
  def self.all_ratings
    array = Array.new
    self.select("rating").uniq.each {|x| array.push(x.rating)}
    array.sort.uniq
  end

  def self.search(search)
    if (search.is_a?(String))
        newsearch = search.downcase.strip
        key = "%#{newsearch}%"
        if search
            where('lower(title) LIKE ?', key)
            else
            all
            end
        end
    end
end