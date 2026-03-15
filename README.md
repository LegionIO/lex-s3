# lex-s3

AWS S3 integration for [LegionIO](https://github.com/LegionIO/LegionIO). Manage S3 buckets and objects from within task chains or as a standalone client library.

## Installation

```bash
gem install lex-s3
```

Or add to your Gemfile:

```ruby
gem 'lex-s3'
```

## Standalone Usage

```ruby
require 'legion/extensions/s3'

client = Legion::Extensions::S3::Client.new(region: 'us-east-2')

# Buckets
client.list_buckets
client.create_bucket(bucket: 'my-bucket')
client.bucket_exists?(bucket: 'my-bucket')
client.delete_bucket(bucket: 'my-bucket')

# Objects
client.put_object(bucket: 'my-bucket', key: 'file.txt', body: 'content')
client.get_object(bucket: 'my-bucket', key: 'file.txt')
client.list_objects(bucket: 'my-bucket')
client.head_object(bucket: 'my-bucket', key: 'file.txt')
client.copy_object(source_bucket: 'my-bucket', source_key: 'file.txt', dest_bucket: 'other-bucket', dest_key: 'copy.txt')
client.delete_object(bucket: 'my-bucket', key: 'file.txt')
```

## Runners

### Buckets

| Method | Parameters | Description |
|--------|-----------|-------------|
| `list_buckets` | (none) | List all buckets in the account |
| `create_bucket` | `bucket:` | Create a new bucket |
| `delete_bucket` | `bucket:` | Delete a bucket |
| `bucket_exists?` | `bucket:` | Check if a bucket exists (returns boolean) |

### Objects

| Method | Parameters | Description |
|--------|-----------|-------------|
| `list_objects` | `bucket:`, `prefix:` (optional) | List objects in a bucket |
| `get_object` | `bucket:`, `key:` | Retrieve an object |
| `put_object` | `bucket:`, `key:`, `body:` | Upload an object |
| `delete_object` | `bucket:`, `key:` | Delete an object |
| `head_object` | `bucket:`, `key:` | Get object metadata without downloading |
| `copy_object` | `source_bucket:`, `source_key:`, `dest_bucket:`, `dest_key:` | Copy an object |

## Requirements

- Ruby >= 3.4
- `aws-sdk-s3` >= 1.0
- AWS credentials (env vars, instance profile, or explicit `access_key_id:` / `secret_access_key:` kwargs)

## License

MIT
