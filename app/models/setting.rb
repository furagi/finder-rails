class Setting

  extend ActiveModel::Naming

  def initialize(id, value)
    @errors = ActiveModel::Errors.new(self)
    @id = id
    @value = value
  end

  attr_accessor :value
  attr_reader   :errors

  def validate!
    errors.add(:id, "should already exists") if Settings.finder[@id].nil?
  end

  # The following methods are needed to be minimally implemented

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def Setting.lookup_ancestors
    [self]
  end

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
    Setting.new key, Settings.finder[key]
  end

  def update_attributes setting
    self.validate!
    puts setting[:value]
    Settings.finder[@id] = setting[:value]
    new_settings = {finder: Settings.finder}
    File.open(Rails.root.join("config", "settings/finder.local.yml").to_s, 'w') { |f| YAML.dump(new_settings, f) }
    Settings.reload!
  end
end


