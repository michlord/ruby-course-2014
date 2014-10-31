require 'fileutils'

class Article
  attr_accessor :author, :title, :content, :likes, :dislikes
end

class ArticleFilesystem
  ARTICLES_FOLDER = "articles_store"
  
  def self.save(article)
    FileUtils.mkdir_p ARTICLES_FOLDER
    file_name = article.title.downcase.tr(' ', '_')
    open(ARTICLES_FOLDER + '/' + file_name, 'w') do |f|
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