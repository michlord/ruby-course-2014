require_relative '../../mock_article'

class MockArticle
  public_class_method  :random_word
end

class TestMockArticle < Test::Unit::TestCase
  def test_random_word
    10.times do
      assert(MockArticle.random_word.is_a?(String))
    end
  end

  def test_random_number
    m = MockArticle.new()
    10.times do
      number = m.random_number
      assert(number >= 0)
      assert(number <= 100)
    end
  end

  def test_generate_author
    m = MockArticle.new()
    10.times do
      author = m.generate_author.split(/\W+/)
      assert_equal(2, author.length)
      first, last = author
      assert_equal(first.capitalize, first)
      assert_equal(last.capitalize, last)
    end
  end

  def test_generate_title
    m = MockArticle.new()
    20.times do
      title = m.generate_title
      words = title.split(/\W+/)
      assert(words.length >= 1)
      assert(words.length <= 5)
      assert_equal(words[0].capitalize, words[0])
    end
  end

  def test_generate_sentence
    m = MockArticle.new()
    20.times do
      sentence = m.generate_sentence
      words = sentence.split(/\W+/)
      assert(words.length >= 5)
      assert(words.length <= 10)
      assert_equal(words[0].capitalize, words[0])
    end
  end

  def test_generate_content
    m = MockArticle.new()
    20.times do
      content = m.generate_content
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
