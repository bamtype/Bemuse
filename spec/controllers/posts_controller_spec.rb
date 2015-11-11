require "rails_helper"

RSpec.describe PostsController, :type => :controller do
 
let(:valid_attributes) do   
    { title: "Puffy",     
     link: "fluffster@aol.com",     
     description: "Badboy Records",    
     image: "",     
      } 
    end

    let(:valid_session) { {post_id: 1} }
    let(:post) { Post.create valid_attributes}
    
    describe "GET index" do   
        it "assigns all posts as @posts" do 
      post = Post.create! valid_attributes    
      get :index, {}, valid_session     
      expect(assigns(:posts)).to eq([post])   
       end
    end 

    describe "Get show" do
      it "assigns the the requested do as @post" do
	        post = Post.create! valid_attributes 
	        get :show, { id: post.id }, valid_session
	        expect(assigns(:post)).to eq(post)
      end
    end


    
  #   describe "GET new" do
  #     it "assigns a new post as @post" do
	 #      get :new, {}, valid_attributes
	 #      expect(assigns(:post)).to be_a_new(Post)
  #   end
  # end
  
    describe "GET edit" do
    it "assigns the requested post as @post" do
            get :edit, { id: post.id }, valid_attributes
            expect(assigns(:post)).to eq(post)
        end
    end

    describe "DELETE destroy" do
      it "destroys the requested post" do
      post = Post.create! valid_attributes 
      delete :destroy, { id: post.id }, valid_session
      expect(Post.find_by_id(:post)).to be_nil
      end 
      it "redirects to the posts list" do
      post = Post.create! valid_attributes 
      delete :destroy, { id: post.id }, valid_session
      expect(response).to redirect_to(root_path)
    end
    end
 

    #   describe "POST create" do
    #   it "creates the requested post" do
    #   post :create, {post: valid_attributes}, valid_session
    #   expect(Post.find_by_user_id(valid_attributes[:email])).to be_present
    #   end
    # end



    # describe "PUT 'update/:id'" do
    #   it "allows post to be updated" do
    #   @attr = { :title => "new title", :content => "new content" }
    #   put :update, :id => @article.id, :article => @attr
    #   response.should be_successful
    #   end
    # end
end
