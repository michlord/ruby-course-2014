require_relative 'article'

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
    @articles.sort { |art_1, art_2| art_1.positive_votes - art_2.positive_votes }
  end

  def best_articles
    @articles.sort { |art_1, art_2| art_2.positive_votes - art_1.positive_votes }
  end

  def worst_article
    worst_articles.first
  end

  def best_article
    best_articles.first
  end

  def most_popular_article
    @articles.max_by { |art| art.votes }
  end

  def include?(pattern)
    @articles.any? { |art| art.include?(pattern) }
  end

  def authors
    @articles.map { |art| art.author }.uniq
  end

  def number_of_authors
    authors.length
  end

  def votes
    @articles.inject(0) { |sum, art| sum + art.votes }
  end

  def to_s
    @articles.map.with_index { |art, i| i.to_s + ' ' + art.to_s }.join("\n")
  end
end


