# frozen_string_literal: true

module Legion
  module Extensions
    module S3
      module Runners
        module Buckets
          def list_buckets(**)
            resp = s3_client(**).list_buckets
            { buckets: resp.buckets.map { |b| { name: b.name, creation_date: b.creation_date.to_s } } }
          end

          def create_bucket(bucket:, **)
            s3_client(**).create_bucket(bucket: bucket)
            { created: true, bucket: bucket }
          end

          def delete_bucket(bucket:, **)
            s3_client(**).delete_bucket(bucket: bucket)
            { deleted: true, bucket: bucket }
          end

          def bucket_exists?(bucket:, **)
            s3_client(**).head_bucket(bucket: bucket)
            { exists: true, bucket: bucket }
          rescue Aws::S3::Errors::NotFound, Aws::S3::Errors::NoSuchBucket => _e
            { exists: false, bucket: bucket }
          end
        end
      end
    end
  end
end
