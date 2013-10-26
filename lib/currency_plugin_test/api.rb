require 'time'

require 'killbill'

module Killbill
  module CurrencyPlugin
    class TestPlugin < Killbill::Plugin::Currency

      def initialize()
        @raise_exception = false
        super()
      end


      def start_plugin
        super
      end

      # return DB connections to the Pool if required
      def after_request
      end

      def get_base_currencies(options = {})
        ['USD']
      end

      def get_latest_conversion_date(base_currency, options = {})
        Time.now.utc
      end

      def get_conversion_dates(base_currency, options = {})
        [Time.now.utc]
      end

      def get_current_rates(base_currency, options = {})

        rate = Killbill::Plugin::Model::Rate.new
        rate.base_currency = base_currency
        rate.currency = 'BRL'
        rate.value = 12.3
        rate.conversion_date = Time.now.utc
        [rate]
      end

      def get_rates(base_currency, conversion_date, options = {})
        get_current_rates(base_currency, options)
      end

    end
  end
end
