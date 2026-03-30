# frozen_string_literal: true

require 'legion/extensions/s3/version'
require 'legion/extensions/s3/helpers/client'
require 'legion/extensions/s3/runners/buckets'
require 'legion/extensions/s3/runners/objects'
require 'legion/extensions/s3/client'

module Legion
  module Extensions
    module S3
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core, false
    end
  end
end
