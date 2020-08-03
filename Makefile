# Launch development console
.PHONY: console
console:
	bin/console

# Running rspec tests
.PHONY: rspec
rspec:
	bundle exec rspec

# Running rubocop
.PHONY: rubocop
rubocop:
	bundle exec rubocop

# Running bundle-audit
.PHONY: audit
audit:
	bundle exec bundle-audit check --update

# Run all checks
.PHONY: check
check: rubocop audit rspec
