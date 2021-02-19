module RequestHelper

  def self.get(url)
    begin
      response = Net::HTTP.get(URI(url))
      {status: :ok, response: JSON.parse(response)}
    rescue => exception
      {status: :error, response: exception}
    end
  end

end
