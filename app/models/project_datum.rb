class ProjectDatum < ApplicationRecord

  def self.set_key_value key, value
    data = ProjectDatum.where(key: key)
    if data.exists?
      data = data.last
      data.value = value
    else
      data = ProjectDatum.new(key: key, value: value)
    end
    data.save
  end

  def self.get_value(key)
    where(key: key).last.try(:value)
  end


  def self.update_value key
    p "actualizando data..."
    p "#{ENV['OPEN_EXCHANGE_RATE_APP_ID']}"
    response = open("https://openexchangerates.org/api/latest.json?app_id=#{ENV['OPEN_EXCHANGE_RATE_APP_ID']}").read
    timestamp = JSON.parse(response)["timestamp"] if response.present? && response.include?("timestamp")
    if timestamp.present?
      p "guardando..."
      ProjectDatum.set_key_value(key, response)
    end    
  end

end
