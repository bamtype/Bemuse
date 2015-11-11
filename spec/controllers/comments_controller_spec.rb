    require "rails_helper"

RSpec.describe CommentsController, :type => :controller do
 
let(:valid_attributes) do   
    { comment: ""               
      } 
    end

  let(:valid_session) { {comments_id: 1} }
  let(:comments) { Comments.create valid_attributes}


    #  describe "COMMENTS create" do
    #   it "creates the comment to a post" do
    #   post :create, {post: valid_attributes}, valid_session
    #   expect(Post.find_by_user_id(valid_attributes[:email])).to be_present
    #   end
    # end
      describe "POST create" do
    # describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {:comment => valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {:comment => valid_attributes}, valid_session
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, {:comment => valid_attributes}, valid_session
        response.should redirect_to(Comment.last)
      end
    # end
  end
end