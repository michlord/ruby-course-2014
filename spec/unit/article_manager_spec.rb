require_relative '../../article'
require_relative '../../article_manager'

class ArticleManagerSpec < Test::Unit::TestCase
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
    @article_4 = Article.new("Goroth the Doomed",
      "He has a real deadly trap set up for you there.",
      "Ninja")
    
    5.times { @article_1.like! }
    3.times { @article_1.dislike! }
    
    2.times { @article_2.like! }
    6.times { @article_2.dislike! }
    
    5.times { @article_3.like! }
    5.times { @article_3.dislike! }
    
    10.times { @article_4.like! }
    
    @article_manager = ArticleManager.new([@article_1, @article_2, @article_3, @article_4])
  end

  def test_worst_articles
    assert_equal([@article_2, @article_3, @article_1, @article_4],
                  @article_manager.worst_articles)
  end

  def test_best_articles
    assert_equal([@article_4, @article_1, @article_3, @article_2],
                  @article_manager.best_articles)
  end

  def test_worst_article
    assert_equal(@article_2, @article_manager.worst_article)
  end

  def test_best_article
    assert_equal(@article_4, @article_manager.best_article)
  end

  def test_most_popular_article
    assert(@article_3 == @article_manager.most_popular_article ||
           @article_4 == @article_manager.most_popular_article)
  end

  def test_include?
    assert(@article_manager.include?("need"))    
    assert(!@article_manager.include?("Boroth"))
  end

  def test_authors
    assert_equal(["Officer Nasty", "The Rufmeister General", "Ninja"],
                  @article_manager.authors)
  end

  def test_number_of_authors
    assert_equal(3, @article_manager.number_of_authors)
  end

  def test_votes
    assert_equal(36, @article_manager.votes)
  end

  def test_to_s
    str = "0 title: This feels dirty content: Play it on a mac and the world would collapse. author: Officer Nasty\n" +
    "1 title: The future is now! content: Now all you need is a PC emulator and you've pretty much got it all. author: The Rufmeister General\n" +
    "2 title: The AI is learning. content: Go buy it and sink the rest of your life into it. author: Officer Nasty\n" +
    "3 title: Goroth the Doomed content: He has a real deadly trap set up for you there. author: Ninja"
    
    assert_equal(str, @article_manager.to_s)
  end
  
  def test_load_articles
    manager = ArticleManager.new
    manager.load_articles("articles_store")
    assert(!manager.articles.empty?)
  end
end
