require_relative '../../article'

class Article
  attr_accessor :title, :content, :author, :likes, :dislikes, :created_at
end

class ArticleSpec < Test::Unit::TestCase
  def setup
    @article = Article.new("This feels dirty",
          "Play it on a mac and the world would collapse.",
          "Officer Nasty")

    5.times { @article.like! }
    3.times { @article.dislike! }
  end

  def test_like!
    assert_equal(5, @article.likes)
    @article.like!
    assert_equal(6, @article.likes)
  end

  def test_dislike!
    assert_equal(3, @article.dislikes)
    @article.dislike!
    assert_equal(4, @article.dislikes)
  end

  def test_positive_votes
    assert_equal(2, @article.positive_votes)
    @article.like!
    @article.like!
    @article.dislike!
    assert_equal(3, @article.positive_votes)
  end

  def test_votes
    assert_equal(8, @article.votes)
  end

  def test_shortened_to
    assert_equal("Play it on a mac and the world would colla...", @article.shortened_to(45))
    assert_equal("Play it on a mac and the world would collapse.", @article.shortened_to(46))
  end

  def test_include?
    assert(@article.include?("world"))
    assert(!@article.include?("marcin"))
  end

  def test_words
    assert_equal(
      ["Play", "it", "on", "a", "mac", "and", "the", "world", "would", "collapse"],
      @article.words
    )
  end

  def test_distinct_words
    assert_equal(
      ["Play", "it", "on", "a", "mac", "and", "the", "world", "would", "collapse"],
      @article.distinct_words
    )
  end
end
