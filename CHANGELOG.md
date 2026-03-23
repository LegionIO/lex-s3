# Changelog

## [0.2.1] - 2026-03-22

### Changed
- Added runtime dependencies on legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, legion-transport (>= version constraints matching ecosystem)
- Replaced spec_helper stubs with real sub-gem helper requires and canonical Helpers::Lex + actor stubs
- Updated Gemfile to use test group with simplecov, rspec_junit_formatter, and rexml

## [0.2.0] - 2026-03-15

### Added
- `Helpers::Client` module for building AWS S3 client connections
- `Runners::Buckets` with list_buckets, create_bucket, delete_bucket, bucket_exists?
- `Runners::Objects` with list_objects, get_object, put_object, delete_object, head_object, copy_object
- Standalone `Client` class including all runner modules
- 10 specs with full coverage
