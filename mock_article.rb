require_relative  'article'

class MockArticle < Article
  WORD_LIST = ["about","after","again","air","all",
               "along","also","an","and","another",
               "any","are","around","as","at","away",
               "back","be","because","been","before",
               "below","between","both","but","by",
               "came","can","come","could","day",
               "did","different","do","does","dont",
               "down","each","end","even","every",
               "few","find","first","for","found",
               "from","get","give","go","good","great",
               "had","has","have","he","help","her",
               "here","him","his","home","house","how",
               "I","if","in","into","is","it",
               "its","just","know","large","last","left",
               "like","line","little","long","look","made",
               "make","man","many","may","me","men",
               "might","more","most","Mr","must","my",
               "name","never","new","next","no","not"]

  def initialize
    super(generate_title, generate_content, generate_author)
    @likes = random_number
    @dislikes = random_number
  end

  def self.random_word
    WORD_LIST.sample
  end

  def random_number
    rand 100
  end

  def generate_author
    MockArticle.random_word.capitalize + " " + 
      MockArticle.random_word.capitalize
  end

  def generate_title
    title = MockArticle.random_word.capitalize
    rand(0..4).times { title += " " + MockArticle.random_word }
    title
  end

  def generate_sentence
    sentence = MockArticle.random_word.capitalize
    rand(4..9).times { sentence += " " + MockArticle.random_word }
    sentence + "."
  end

  def generate_content
    content = generate_sentence
    rand(0..4).times { content += " " + generate_sentence}
    content
  end
  
  private_class_method :random_word
end

