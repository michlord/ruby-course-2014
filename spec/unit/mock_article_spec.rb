require_relative '../../mock_article'

class MockArticle
  public_class_method  :random_word
end

class MockArticleSpec < Test::Unit::TestCase
  def setup
    @mock_article = MockArticle.new
  end

  def test_random_word
    random_words = []
    10.times { random_words << MockArticle.random_word }
    assert(random_words.all? { |word| MockArticle::WORD_LIST.include?(word) })
  end

  def test_random_number
    10.times do
      number = @mock_article.random_number
      assert(number >= 0)
      assert(number <= 100)
    end
  end

  def test_generate_author
    10.times do
      author = @mock_article.generate_author.split(/\W+/)
      assert_equal(2, author.length)
      first, last = author
      assert_equal(first.capitalize, first)
      assert_equal(last.capitalize, last)
    end
  end

  def test_generate_title
    20.times do
      title = @mock_article.generate_title
      words = title.split(/\W+/)
      assert(words.length >= 1)
      assert(words.length <= 5)
      assert_equal(words[0].capitalize, words[0])
    end
  end

  def test_generate_sentence
    20.times do
      sentence = @mock_article.generate_sentence
      words = sentence.split(/\W+/)
      assert(words.length >= 5)
      assert(words.length <= 10)
      assert_equal(words[0].capitalize, words[0])
    end
  end

  def test_generate_content
    20.times do
      content = @mock_article.generate_content
      # There must be a space after each period
      # except the last one.
      sentences = content.split(". ")
      # Make sure there are no extra spaces
      # around a sentence.
      sentences.each do |s|
        assert_equal(s.strip, s)
      end
      assert(sentences.length >= 1)
      assert(sentences.length <= 5)
    end
  end
end
