require 'rails_helper'

RSpec.describe "Link redirection", type: :request do
  esdcribe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end

  it "redirect to original url" do
    shortener = Shortener.new("https://stackoverflow.com/questions/22993545/ruby-email-validation-with-regex")
    link=shortener.generate_shorten_url

    get link.shortened_url

    expect(response).to redirect_to(link.original_url)
  end

end