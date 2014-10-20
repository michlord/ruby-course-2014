require_relative '../../article'

class Article
  attr_accessor :title, :content, :author, :likes, :dislikes, :created_at
end

class TestArticle < Test::Unit::TestCase
  def setup
    @article_1 = Article.new("This feels dirty",
          "Play it on a mac and the world would collapse.",
          "Officer Nasty")
    @article_2 = Article.new("The future is now!",
          "Now all you need is a PC emulator and you've pretty much got it all.",
          "The Rufmeister General")
    @article_3 = Article.new("The AI is learning.",
          "Go buy it and sink the rest of your life into it.",
          "Officer Nasty")
          
    5.times { @article_1.like! }
    3.times { @article_1.dislike! }
    
    2.times { @article_2.like! }
    6.times { @article_2.dislike! }
    
    5.times { @article_3.like! }
    5.times { @article_3.dislike! }
  end

  def test_like!
    assert_equal(5, @article_1.likes)
    @article_1.like!
    assert_equal(6, @article_1.likes)
  end

  def test_dislike!
    assert_equal(3, @article_1.dislikes)
    @article_1.dislike!
    assert_equal(4, @article_1.dislikes)
  end

  def test_positive_votes
    assert_equal(2, @article_1.positive_votes)
    @article_1.like!
    @article_1.like!
    @article_1.dislike!
    assert_equal(3, @article_1.positive_votes)
  end

  def test_votes
    assert_equal(8, @article_1.votes)
    assert_equal(8, @article_2.votes)
    assert_equal(10, @article_3.votes)
  end

  def test_shortened_to
    assert_equal("Play it on a mac and...", @article_1.shortened_to(23))
    assert_equal("Play it on a mac and the world would collapse.", @article_1.shortened_to(60))
    assert_equal("Play it on a mac and the world would collapse.", @article_1.shortened_to(70))
    assert_equal("Play it on a mac and the world would colla...", @article_1.shortened_to(45))
    assert_equal("Play it on a mac and the world would collapse.", @article_1.shortened_to(46))
    assert_equal("Play it on a mac and the world would collapse.", @article_1.shortened_to(48))
    assert_equal(".", @article_1.shortened_to(1))
    assert_equal("...", @article_1.shortened_to(3))
    assert_equal("P...", @article_1.shortened_to(4))
    assert_equal("", @article_1.shortened_to(-5))
  end

  def test_include?
    assert(@article_1.include?("world"))
    assert(@article_1.include?("mac"))
    assert(@article_1.include?("mac and"))
    assert(@article_1.include?("Pl"))
      
    assert(@article_1.include?("world  ") == false)
    assert(@article_1.include?("macin") == false)
    assert(@article_1.include?("mac and A") == false)
    assert(@article_1.include?("..") == false)
  end

  def test_words
    assert_equal(
      ["Play", "it", "on", "a", "mac", "and", "the", "world", "would", "collapse"],
      @article_1.words
    )
    assert_equal(
      ["Now", "all", "you", "need", "is", "a", "PC", "emulator", "and", "you",
        "ve", "pretty", "much", "got", "it", "all"],
      @article_2.words
    )
    assert_equal(
      ["Go", "buy", "it", "and", "sink", "the", "rest", "of", "your", "life", "into", "it"],
      @article_3.words
    )
  end

  def test_distinct_words
    assert_equal(
      ["Play", "it", "on", "a", "mac", "and", "the", "world", "would", "collapse"],
      @article_1.distinct_words
    )
    assert_equal(
      ["Now", "all", "you", "need", "is", "a", "PC", "emulator",
        "and", "ve", "pretty", "much", "got", "it"],
      @article_2.distinct_words
    )
    assert_equal(
      ["Go", "buy", "it", "and", "sink", "the", "rest", "of", "your", "life", "into"],
      @article_3.distinct_words
    )
  end
end
