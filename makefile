.PHONY: generate
generate:
	fvm flutter pub run build_runner build --delete-conflicting-outputs 

.PHONY: run
run:
	fvm flutter clean && flutter pub get && flutter analyze && flutter run
