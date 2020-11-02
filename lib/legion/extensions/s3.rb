require 'legion/extensions/s3/version'

module Legion
  module Extensions
    module S3
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
