# frozen_string_literal: true

require 'aws-sdk-s3'

module Legion
  module Extensions
    module S3
      module Helpers
        module Client
          def s3_client(region: 'us-east-2', access_key_id: nil, secret_access_key: nil, endpoint: nil, **_opts)
            config = { region: region }
            config[:access_key_id] = access_key_id if access_key_id
            config[:secret_access_key] = secret_access_key if secret_access_key
            config[:endpoint] = endpoint if endpoint
            config[:force_path_style] = true if endpoint
            Aws::S3::Client.new(**config)
          end
        end
      end
    end
  end
end
