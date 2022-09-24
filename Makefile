default: prepare

prepare: check_asdf setup_flutter check_flutter generate

check_asdf:
	@asdf --version
	@echo "asdf ✅"

setup_flutter:
	@asdf install flutter
	@flutter config --no-analytics

check_flutter:
	@flutter --version
	@flutter doctor -v
	@echo "flutter ✅"
	@flutter pub get
	@echo "🚀 dependencies have been updated"

setup_ruby:
	@asdf install ruby
	@ruby --version
	@echo "ruby ✅"
	@bundle --version
	@echo "bundle ✅"

generate: 
	@flutter pub run build_runner build --delete-conflicting-outputs
	@echo "🚀 files have been generated"

clean: 
	@flutter clean
	@echo "clean ✅"

help: 
	@echo "Usage:\n"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "\nDefault: prepare"

pub:
	@flutter pub get
	@echo "🚀 dependencies have been updated"