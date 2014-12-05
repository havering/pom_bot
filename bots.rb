require 'twitter_ebooks'

# Information about a particular Twitter user we know
class UserInfo
  attr_reader :username

  # @return [Integer] how many times we can pester this user unprompted
  attr_accessor :pesters_left

  # @param username [String]
  def initialize(username)
    @username = username
    @pesters_left = 1
  end
end

class CloneBot < Ebooks::Bot
  attr_accessor :original, :model_path

  def configure
    # Configuration for all CloneBots
    self.consumer_key = ""
    self.consumer_secret = ""
    self.blacklist = ['kylelehk', 'friedrichsays', 'Sudieofna', 'tnietzschequote', 'NerdsOnPeriod', 'FSR', 'BafflingQuotes', 'Obey_Nxme']

    @userinfo = {}
  end

  def model
    @model_path ||= "model/#{original}.model"
    if @model.nil?
      log "Loading model #{model_path}"
      @model = Ebooks::Model.load(model_path)
    else
      @model
    end
  end

  def top100; @top100 ||= model.keywords.take(100); end
  def top20; @top20 ||= model.keywords.take(20); end

  def delay(&b)
    sleep (1..4).to_a.sample
    b.call
  end

  def on_startup
    model

    scheduler.cron '0 0 * * *' do
      # Each day at midnight, post a single tweet
      tweet model.make_statement
    end
  end

  def on_direct_message(dm)
    delay do
      reply dm, model.make_response(dm.text)
    end
  end

  def on_mention(tweet)
    # Become more inclined to pester a user when they talk to us
    userinfo(tweet.user.screen_name).pesters_left += 1
    delay do
      reply(tweet, model.make_response(meta(tweet).mentionless, meta(tweet).limit))
    end
  end

  def on_timeline(tweet)
    return if tweet.retweeted_status?
    tokens = Ebooks::NLP.tokenize(tweet.text)

    interesting = tokens.find { |t| top100.include?(t.downcase) }
    very_interesting = tokens.find_all { |t| top20.include?(t.downcase) }.length > 2

    return unless can_pester?(tweet.user.screen_name)

    delay do
      if very_interesting
        favorite(tweet) if rand < 0.5
        retweet(tweet) if rand < 0.1
        reply(tweet, model.make_response(meta(tweet).mentionless, meta(tweet).limit)) if rand < 0.05
      elsif interesting
        favorite(tweet) if rand < 0.05
        reply(tweet, model.make_response(meta(tweet).mentionless, meta(tweet).limit)) if rand < 0.01
      end
    end
  end

  # Find information we've collected about a user
  # @param username [String]
  # @return [Ebooks::UserInfo]
  def userinfo(username)
    @userinfo[username] ||= UserInfo.new(username)
  end

  # Check if we're allowed to send unprompted tweets to a user
  # @param username [String]
  # @return [Boolean]
  def can_pester?(username)
    userinfo(username).pesters_left > 0
  end

  # Only follow our original user or people who are following our original user
  # @param user [Twitter::User]
  def can_follow?(username)
    @original.nil? || username == @original || twitter.friendship?(username, @original)
  end

  def favorite(tweet)
    if !can_follow?(tweet.user.screen_name)
      log "Unfollowing @#{tweet.user.screen_name}"
      twitter.unfollow(tweet.user.screen_name)
    else
      super(tweet)
    end
  end

  def on_follow(user)
    if can_follow?(user.screen_name)
      follow(user.screen_name)
    else
      log "Not following @#{user.screen_name}"
    end
  end
end

CloneBot.new("abby_ebooks") do |bot|
  bot.access_token = ""
  bot.access_token_secret = ""

  bot.original = "0xabad1dea"
end