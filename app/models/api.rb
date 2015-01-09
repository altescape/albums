class Api
  def initialize
    @api = RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])
  end

  def get
    @api
  end
end