# Slack Notifier

A macOS menu bar app that mirrors the Slack desktop app’s Dock badge. The red badge shows single-digit counts and displays `9+` for larger counts.

## Requirements

- macOS 12 or later
- The Slack desktop app
- Xcode to build from source

## Build

From the project folder, run:

```sh
./scripts/build-slack-notifier.sh
```

You can also open `SlackNotifier.xcodeproj` in Xcode and select the **Slack Notifier** scheme. Xcode resolves Swift Package Manager dependencies on the first build. The project currently fetches SwiftUI-Introspect over GitHub SSH.

The script creates `dist/Slack Notifier.app` and `dist/Slack Notifier.zip`. It signs the app ad hoc for local use. `dist/` is ignored by Git.

## Install and use

1. Move `Slack Notifier.app` to Applications and open it.
2. In **System Settings → Privacy & Security → Accessibility**, enable **Slack Notifier**. On some macOS versions the pane is called **Device Control and Data Access**. If an updated build stops showing counts, re-add the app from Applications and relaunch it.
3. Make sure the Slack desktop app is showing its unread badge in the Dock. The notifier mirrors the badge Slack provides.

Click the menu bar icon to open Slack. Right-click or Option-click for Quit and, when needed, the Accessibility settings shortcut.

## Credits

Based on [Doll](https://github.com/xiaogdgenuine/Doll) by xiaogdgenuine and contributors. Slack artwork belongs to its respective rights holder.
