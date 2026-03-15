# Changelog

## [0.2.0] - 2026-03-15

### Added
- `Helpers::Client` module for building AWS S3 client connections
- `Runners::Buckets` with list_buckets, create_bucket, delete_bucket, bucket_exists?
- `Runners::Objects` with list_objects, get_object, put_object, delete_object, head_object, copy_object
- Standalone `Client` class including all runner modules
- 10 specs with full coverage
