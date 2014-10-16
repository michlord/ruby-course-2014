require_relative 'article'

#Gain access to Article's author name. Overload to_s
class Article
  attr_reader :author 
  def to_s
    "title: " + @title + " content: " + @content + " author: " + @author
  end
end

class ArticleManager
  def initialize(articles = [])
    @articles = articles
  end
  def worst_articles
    @articles.sort { |x, y| x.positive_votes - y.positive_votes }
  end
  def best_articles
    @articles.sort { |x, y| y.positive_votes - x.positive_votes }
  end
  def worst_article
    worst_articles.first
  end
  def best_article
    best_articles.first
  end
  def most_popular_article
    @articles.max_by { |x| x.votes }
  end
  def include?(pattern)
    @articles.find_all { |x| x.include?(pattern) }
  end
  def authors
    @articles.map { |x| x.author }.uniq
  end
  def number_of_authors
    authors.length
  end
  def votes
    @articles.inject(0) { |sum, x| sum + x.votes }
  end
  def to_s
    @articles.map.with_index { |x, i| i.to_s + ' ' + x.to_s }.join("\n")
  end
end


