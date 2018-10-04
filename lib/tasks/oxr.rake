namespace :open_exchange_rates do
  desc "Update rates values from OpenExchangeRates.org"
  task update_rates: :environment do
    old_data = ProjectDatum.where(key: "open_exchange_rates")

    if old_data.exists?
      old_data = old_data.last
      if old_data.updated_at < 12.hours.ago
        ProjectDatum.update_value("open_exchange_rates")
      else
        p "Aun no pasan 12 horas"
      end
    else
      ProjectDatum.update_value("open_exchange_rates")
    end

  end
end