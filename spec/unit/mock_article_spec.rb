require_relative '../../mock_article'

class MockArticleSpec < Test::Unit::TestCase
  def setup
    @mock_article = MockArticle.new
  end

  def test_random_number
    10.times do
      number = @mock_article.random_number
      assert(number >= 0)
      assert(number <= 100)
    end
  end
end
