require 'nokogiri'
require 'open-uri'
require 'stamp'
require 'openssl'

require_relative 'article'

class Article
  attr_accessor :created_at
end

class ArticleInternet
  URL = "https://zapisy.ii.uni.wroc.pl/news/"
  def self.load
    page = Nokogiri::HTML(open(URL,{ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
    articles = []
    
    page_articles = page.css("#news-content").first.css(".od-news-list .od-news-item")
    page_articles.each do |art|
      title = art.css(".od-news-header h3").text.strip
      date_time = art.css(".od-news-header span").text.split(/[,-]/)[1,2].map { |x| x.strip }.join(" ")
      created_at = Time.strptime(date_time, "%d.%m.%Y %H:%M")
      content = art.css(".od-news-body").text
      author = art.css(".od-news-footer").text.strip
      article = Article.new(title, content, author)
      article.created_at = created_at
      articles << article      
    end
    
    return articles
  end
end
