require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  movie = Movie.first
  context 'check if comment is made' do
    it 'ensures author name is present' do

      comment = movie.comments.create(author_name:"Bob", body: "Shit works!")
      expect(comment).to eq(true)
    end
  end
end
