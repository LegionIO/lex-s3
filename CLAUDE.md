# lex-s3: AWS S3 Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent (Level 2)**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`
- **Parent (Level 1)**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to AWS S3. Provides bucket and object management from within Legion task chains, plus a standalone Client class for use outside the full framework.

**GitHub**: https://github.com/LegionIO/lex-s3
**License**: MIT

## Architecture

```
Legion::Extensions::S3
├── Helpers::Client     # AWS S3 client builder (region, credentials, endpoint)
├── Runners::Buckets    # list_buckets, create_bucket, delete_bucket, bucket_exists?
├── Runners::Objects    # list_objects, get_object, put_object, delete_object, head_object, copy_object
└── Client              # Standalone class — includes all runners; config via kwargs
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/s3.rb` | Entry point, extension registration |
| `lib/legion/extensions/s3/version.rb` | Version constant (0.2.0) |
| `lib/legion/extensions/s3/helpers/client.rb` | Builds `Aws::S3::Client` with region, credentials, endpoint support |
| `lib/legion/extensions/s3/runners/buckets.rb` | Bucket-level operations |
| `lib/legion/extensions/s3/runners/objects.rb` | Object-level operations |
| `lib/legion/extensions/s3/client.rb` | Standalone Client class |

## Dependencies

| Gem | Version | Purpose |
|-----|---------|---------|
| `aws-sdk-s3` | >= 1.0 | AWS S3 API client |

Dev dependencies: `bundler`, `rake`, `rspec`, `rubocop`.

## Testing

13 examples across `spec/legion/extensions/s3_spec.rb` and `spec/legion/extensions/s3/client_spec.rb`.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
