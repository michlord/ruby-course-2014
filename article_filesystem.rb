require 'fileutils'
require_relative 'article'
require_relative 'article_manager'

class Article
  attr_accessor :author, :title, :content, :likes, :dislikes
end

class ArticleManager
  attr_accessor :articles
end

def friendly_filename(filename)
    filename.gsub(/[^\w\s_-]+/, '')
            .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
            .gsub(/\s+/, '_')[0..60]
end

class ArticleFilesystem
  ARTICLES_FOLDER = "articles_store"
  
  def self.save(article)
    FileUtils.mkdir_p ARTICLES_FOLDER
    file_name = friendly_filename(article.title.downcase.tr(' ', '_'))
    File.open(ARTICLES_FOLDER + '/' + file_name, 'w') do |f|
      f << article.author << '|' << article.title << '|' << 
        article.content << '|' << article.likes << '|' << article.dislikes
    end
  end
  
  def self.load(path)
    File.open(path, 'r') do |f|
      author, title, content, likes, dislikes = f.readline.split('|')      
      art = Article.new(title, content, author)
      art.likes = likes.to_i
      art.dislikes = dislikes.to_i
      return art
    end
  end
end