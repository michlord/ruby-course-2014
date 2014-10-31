require 'fileutils'

class Article
  attr_reader :author, :title, :content, :likes, :dislikes
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
end