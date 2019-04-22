require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  context 'check if comment is made' do
    it 'ensures comment body and name are validated' do
      comment = Comment.new(author_name:"Bob", body: "Shit works!").save
      expect(comment).to eq(true)
    end

    it 'ensures comment body is checked' do
      comment = Comment.new(author_name:"Bob").save
      expect(comment).to eq(false)
    end

    it 'ensures comment author_name is checked' do
      comment = Comment.new(body: "Shit works!").save
      expect(comment).to eq(false)
    end
  end
end
