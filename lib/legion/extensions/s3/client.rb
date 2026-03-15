# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/buckets'
require_relative 'runners/objects'

module Legion
  module Extensions
    module S3
      class Client
        include Helpers::Client
        include Runners::Buckets
        include Runners::Objects

        attr_reader :opts

        def initialize(region: 'us-east-2', access_key_id: nil, secret_access_key: nil, endpoint: nil, **extra)
          @opts = { region: region, access_key_id: access_key_id, secret_access_key: secret_access_key,
                    endpoint: endpoint, **extra }.compact
        end

        def s3_client(**override)
          super(**@opts, **override)
        end
      end
    end
  end
end
