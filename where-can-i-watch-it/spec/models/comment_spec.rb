require 'rails_helper'

describe Comment do
  describe 'create comment for movie' do
    context 'with movie page open' do
      it 'should be able to create a comment' do
        a = Movie.first
        a.comments.new
      end
    end
  end
end
