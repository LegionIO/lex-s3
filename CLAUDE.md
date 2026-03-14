# lex-s3: AWS S3 Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent (Level 2)**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`
- **Parent (Level 1)**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to AWS S3. Provides the foundation for interacting with S3 buckets and objects from within Legion task chains.

**GitHub**: https://github.com/LegionIO/lex-s3
**License**: MIT

## Status

This extension is a **stub**. The framework registration boilerplate is in place (`Legion::Extensions::Core` extension), but no runners, helpers, or client classes have been implemented yet. There are no runtime gem dependencies declared in the gemspec.

When implementing, the `aws-sdk-s3` gem is the expected runtime dependency. Follow the standalone Client pattern from `extensions/CLAUDE.md`.

## Architecture

```
Legion::Extensions::S3
└── (stub - framework registration only, no runners implemented)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/s3.rb` | Entry point, extension registration |
| `lib/legion/extensions/s3/version.rb` | Version constant (0.1.0) |

## Dependencies

None declared (stub). Dev dependencies: `bundler`, `rake`, `rspec`, `rubocop`.

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
