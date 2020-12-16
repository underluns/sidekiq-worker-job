.PHONY: console
console:
	bin/console

.PHONY: rspec
rspec:
	bundle exec rspec

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: audit
audit:
	bundle exec bundle-audit check --update

.PHONY: check
check: rubocop audit rspec
