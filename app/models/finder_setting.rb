class FinderSetting

  def self.all
    Settings.finder
  end

  def self.find key
    Settings.finder.to_json #to prevent strange issue
    #example:
    #> Settings.finder[:socials].to_json
    #=> "[[[\"name\",\"facebook\"],[\"url\",\"facebook.com/\"]],[[\"name\",\"instagram,\"],[\"url\",\"instagram.com\"]]]"
    #> Settings.finder.to_json
    #=> "{\"socials\":[{\"name\":\"facebook\",\"url\":\"facebook.com/\"},{\"name\":\"instagram,\",\"url\":\"instagram.com\"}],\"title\":\"MDLS TEEM\"}"
    #> Settings.finder[:socials].to_json
    #=> "[{\"name\":\"facebook\",\"url\":\"facebook.com/\"},{\"name\":\"instagram,\",\"url\":\"instagram.com\"}]"
    setting = Hash.new
    setting[key] = Settings.finder[key]
    setting
  end

  def update key, value

    Settings.reload!
    setting = Hash.new
    setting[key] = Settings.finder[key]
    setting
  end
end
