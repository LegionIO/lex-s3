# frozen_string_literal: true

module Legion
  module Extensions
    module S3
      module Runners
        module Objects
          def list_objects(bucket:, prefix: nil, max_keys: 1000, **)
            params = { bucket: bucket, max_keys: max_keys }
            params[:prefix] = prefix if prefix
            resp = s3_client(**).list_objects_v2(**params)
            { objects: resp.contents.map { |o| { key: o.key, size: o.size, last_modified: o.last_modified.to_s } },
              count:   resp.key_count }
          end

          def get_object(bucket:, key:, **)
            resp = s3_client(**).get_object(bucket: bucket, key: key)
            { key: key, body: resp.body.read, content_type: resp.content_type, content_length: resp.content_length }
          end

          def put_object(bucket:, key:, body:, content_type: nil, **)
            params = { bucket: bucket, key: key, body: body }
            params[:content_type] = content_type if content_type
            s3_client(**).put_object(**params)
            { uploaded: true, bucket: bucket, key: key }
          end

          def delete_object(bucket:, key:, **)
            s3_client(**).delete_object(bucket: bucket, key: key)
            { deleted: true, bucket: bucket, key: key }
          end

          def head_object(bucket:, key:, **)
            resp = s3_client(**).head_object(bucket: bucket, key: key)
            { key: key, content_type: resp.content_type, content_length: resp.content_length,
              last_modified: resp.last_modified.to_s, etag: resp.etag }
          end

          def copy_object(source_bucket:, source_key:, bucket:, key:, **)
            s3_client(**).copy_object(
              copy_source: "#{source_bucket}/#{source_key}",
              bucket:      bucket,
              key:         key
            )
            { copied: true, source: "#{source_bucket}/#{source_key}", destination: "#{bucket}/#{key}" }
          end
        end
      end
    end
  end
end
