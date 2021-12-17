require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET /index" do
    it "responds successfully" do
      sign_in @user
      get :index
      expect(response).to be_successful
    end
    it "200レスポンスが返ってきているか？" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end

    it "responds successfully" do
      get :index
      expect(response).not_to be_successful
    end

    it "301レスポンスが返ってきているか？" do
      get :index
      expect(response).to have_http_status "302"
    end
  end

  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: { id: @blog.id }
      expect(response).to be_successful
    end
    it "returns a 200レスポンスが返ってきているか？" do
      sign_in @user
      get :show, params: { id: @blog.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :show, params: { id: @blog.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :show, params: { id: @blog.id }
      expect(response).to have_http_status "302"
    end
  end

  describe "#create" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end
    it "正常に日程を作成できているか？" do
      sign_in @user
      post :create, params: { id: @blog.id,blog: {title: @blog.title, content: @blog.content, start_time: @blog.start_time } }
      expect(response).to redirect_to blogs_path
    end
  end

  describe "#edit" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :edit, params: { id: @blog.id }
      expect(response).to be_successful
    end
    it "returns a 200レスポンスが返ってきているか？" do
      sign_in @user
      get :edit, params: { id: @blog.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :edit, params: { id: @blog.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :edit, params: { id: @blog.id }
      expect(response).to have_http_status "302"
    end
  end

  describe "#update" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end
    it "正常に変更を更新を作成できているか？" do
      sign_in @user
      patch :update, params: { id: @blog.id,blog: {title: @blog.title, content: @blog.content, start_time: @blog.start_time } }
      expect(response).to redirect_to blogs_path
    end
  end
  describe "#destroy" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end
    context "正常に記事を削除できるか？" do
      it "deletes an blog" do
        sign_in @user
        expect {
          delete :destroy, params: {id: @blog.id}
        }.to change(@user.blogs, :count).by(-1)
      end
      it "投稿を削除した後、ルートページへリダイレクトしているか？" do
        sign_in @user
        delete :destroy, params: {id: @blog.id}
        expect(response).to redirect_to blogs_path
      end
    end
  end
end