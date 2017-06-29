module Daimler
  module Images
    class Vehicle
      attr_reader :vin, :client, :options

      def initialize(options = {})
        raise "Please supply a vin number. Eg: vin: WDD2130331A123456" unless options.has_key?(:vin)
        @options = options
        @vin     = options[:vin]
        @client  = options[:client]
      end

      def interior(opt = {})
        fetch(:get, "image/v1/vehicles/#{vin}/vehicle", opt)
      end

      def exterior(opt = {})
        fetch(:get, "image/v1/vehicles/#{vin}/vehicle", opt)
      end

      private
      def fetch(method, path, opt = {})
        params = extract_params_from_options(options.merge(opt))
        client.request(method, path, params)
      end

      def extract_params_from_options(opt)
        params = {}
        params.merge! perspectives_options(opt)
        params.merge! image_size_options(opt)
        params.merge! roof_open_options(opt)
        params.merge! night_options(opt)
        params
      end

      def perspectives_options(opt)
        return {} unless opt.has_key?(:perspectives)

        if opt[:perspectives].is_a?(Array)
          { perspectives: opt[:perspectives].join('%20') }
        else
          { perspectives: opt[:perspectives] }
        end
      end

      def image_size_options(opt)
        return {} unless opt.has_key?(:image_size)
        { imageSize:  opt[:image_size] }
      end

      def roof_open_options(opt)
        return {} unless opt.has_key?(:roof_open)
        { roofOpen: opt[:roof_open] == true }
      end

      def night_options(opt)
        return {} unless opt.has_key?(:night)
        { night: opt[:night] == true  }
      end
    end
  end
end
