class Article
  def initialize(title, content, author = '')
    @title = title
    @content = content
    @author = author
    @likes = 0
    @dislikes = 0
    @created_at = Time.now
  end
  def like!
    @likes += 1
  end
  def dislike!
    @dislikes += 1
  end
  def positive_votes
    @likes - @dislikes
  end
  def votes
    @likes + @dislikes
  end
  def shortened_to(limit)
    if limit >= @content.length
      @content
    elsif limit < 3
      out = ""
      limit.times {out << "."}
      out
    elsif limit < 0
      ""
    else
      @content[0...limit - 3] + '...'
    end
  end
  def include?(item)
    @content.include?(item)
  end
  def words
    @content.split(/\W+/)
  end
  def distinct_words
    words.uniq
  end
end