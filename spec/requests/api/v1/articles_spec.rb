require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /api/v1/articles" do
    subject { get(api_v1_articles_path) }

    context "公開中の記事があるとき" do
      10.times do
        before do
          create(:article, post_status: :published)
        end
      end

      it "記事一覧が取得できること" do
        subject
        res = JSON.parse(response.body)

        expect(res["data"].length).to eq(10)
        expect(res["data"][0]["attributes"].keys).to include("title", "body", "user_id", "post_status")
        expect(response.status).to eq(200)
      end
    end

    context "記事がすべて非公開のとき" do
      before { create_list(:article, 10) }

      it "空配列が返ること" do
        subject
        res = JSON.parse(response.body)
        expect(res["data"].length).to eq(0)
        expect(response.status).to eq(200)
      end
    end
  end

  describe "POST /api/v1/articles" do

    subject do
      post(
        api_v1_articles_path,
        params: article_params,
        headers: authentication_headers_for(current_user)
      )
    end

    context "ユーザーがログインしているとき" do
      let(:current_user) { create(:user) }
      let(:article_params) { { article: attributes_for(:article) } }
      it "記事のレコードが作成できること" do
        expect { subject }.to change { Article.count }.by(1)
        res = JSON.parse(response.body)
        expect(res["data"]["attributes"]["body"]).to eq(Article.last.body)
        expect(res["data"]["attributes"]["title"]).to eq(Article.last.title)
        expect(res["data"]["attributes"]["user_id"]).to eq(current_user.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context "ユーザーがログインしていないとき" do
      let!( :current_user) { nil }
      let!(:params) { { article: attributes_for(:article) } }
      it "エラーが返ってくること" do
        post(api_v1_articles_path, params: params)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:unauthorized)
        expect(res["errors"]).to include("You need to sign in or sign up before continuing.")
      end
    end
  end

  describe "GET /api/v1/articles/:id" do
    subject do
      get(
        api_v1_article_path(article_id)
      )
    end

    context "指定した記事idが見つからないとき" do
      let!(:article_id) { 1000 }
      it "エラーが返ってくること" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "指定した他のユーザーの記事idが見つかったとき" do
      let!(:article) { create(:article, user_id: other_user_id, post_status: :published) }
      let!(:article_id) { article.id }
      let!(:other_user) { create(:user) }
      let!(:other_user_id) { other_user.id }
      let!(:current_user) { create(:user) }
      it "記事の値が取得できること" do
        subject
        res = JSON.parse(response.body)
        expect(res["data"]["attributes"]["title"]).to eq(article.title)
        expect(res["data"]["attributes"]["body"]).to eq(article.body)
        expect(res["data"]["attributes"]["user_id"]).to eq(other_user.id)
      end
    end

    context "ユーザーがログインしているとき" do
      let!(:article) { create(:article, user_id: current_user_id) }
      let!(:article_id) { article.id }
      let!(:current_user) { create(:user) }
      let!(:current_user_id) { current_user.id }
      it "自分の下書き記事のレコードが取得できること" do
        get(
          api_v1_article_path(article_id),
          headers: authentication_headers_for(current_user)
        )
        res = JSON.parse(response.body)
        expect(res["data"]["attributes"]["title"]).to eq(article.title)
        expect(res["data"]["attributes"]["body"]).to eq(article.body)
        expect(res["data"]["attributes"]["user_id"]).to eq(current_user_id)
      end
    end
  end

  describe "PATCH /api/v1/articles/:id" do

    subject do
      patch(
        api_v1_article_path(article.id, params),
        headers: authentication_headers_for(current_user)
      )

    end
    let!(:article) { create(:article, user_id: current_user.id) }

    context "ユーザーがログインしているとき" do
      let!(:current_user) { create(:user) }
      let!(:params) { { article: { title: Faker::Markdown.headers, created_at: Time.current } } }
      it "任意の記事のレコードが更新できること" do
        expect { subject }.to change { Article.find(article.id).title }.from(article.title).to(params[:article][:title])
        expect { subject }.not_to change { Article.find(article.id).body }
        expect { subject }.not_to change { Article.find(article.id).created_at }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE /api/v1/articles/:id" do
    subject { delete api_v1_article_path(article.id) }

    let!(:article) { create(:article) }

    context "ユーザーがログインしているとき" do
      let!(:current_user) { create(:user) }
      it "任意の記事のレコードが削除できること" do
        expect { subject }.to change { Article.count }.by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
