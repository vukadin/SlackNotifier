#!/bin/bash
set -euo pipefail
project_root="$(cd "$(dirname "$0")/.." && pwd)"
build_dir="${TMPDIR:-/tmp}/SlackNotifier-release"
output_dir="$project_root/dist"

xcodebuild -project "$project_root/SlackNotifier.xcodeproj" \
    -scheme 'Slack Notifier' -configuration Release \
    -derivedDataPath "$build_dir" CODE_SIGNING_ALLOWED=NO build

mkdir -p "$output_dir"
ditto "$build_dir/Build/Products/Release/Slack Notifier.app" "$output_dir/Slack Notifier.app"
codesign --force --deep --sign - --identifier com.njenja.slack-notifier "$output_dir/Slack Notifier.app"
codesign --verify --deep --strict "$output_dir/Slack Notifier.app"
ditto -c -k --sequesterRsrc --keepParent "$output_dir/Slack Notifier.app" "$output_dir/Slack Notifier.zip"
printf 'Built %s\n' "$output_dir/Slack Notifier.app"
