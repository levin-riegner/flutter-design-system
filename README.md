# designsystem

L+R Design System Package

## Setup
1. Run `fastlane match development --readonly` to get the latest development certificates.
## Release process
1. Increased build number and optionally build name on the Flutter `pubspec.yaml`.
2. Publish a new build to Testflight using `fastlane testflight_release`.
> Make sure to always use the shared Apple Account `qa@levinriegner.com` when prompted.
