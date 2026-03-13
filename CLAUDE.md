# lex-s3: AWS S3 Integration for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to AWS S3. Provides the foundation for interacting with S3 buckets and objects from within Legion task chains.

**License**: MIT

## Architecture

```
Legion::Extensions::S3
└── (base extension with S3 integration)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/s3.rb` | Entry point, extension registration |
| `lib/legion/extensions/s3/version.rb` | Version constant |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
