RSpec.describe 'Get /api/articles/id', type: :request do

  let!(:article) { create(:article, title: 'Fun with RSpec!', body: 'This is the article of my content!') }

  before do
  get "/api/articles/#{article.id}"
  end

  it 'is expected to respond with 200' do
    expecte(response).to have_http_status 200
  end
  it 'is expected to include title' do
   expected(JSON.parse(response.body)['article']['title']).to eq 'Fun with RSpec!'
  end

  it 'is expected to include the article body' do
    expected(JSON.parse(response.body)['article']['body']).to eq 'This is the article of my content!'
   end
end