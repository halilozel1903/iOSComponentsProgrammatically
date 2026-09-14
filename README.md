<h1 align="center">iOS Components Programmatically</h1>

<p align="center">
  Small, focused UIKit sample apps that build their user interface entirely in code —
  no storyboards, no XIBs, no <code>frame</code> math.
</p>

<p align="center">
  <a href="#requirements"><img alt="Swift" src="https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white"></a>
  <a href="#requirements"><img alt="Xcode" src="https://img.shields.io/badge/Xcode-26-1575F9?logo=xcode&logoColor=white"></a>
  <a href="#requirements"><img alt="Platform" src="https://img.shields.io/badge/iOS-18.0%2B-000000?logo=apple&logoColor=white"></a>
  <a href="#project-structure"><img alt="UI" src="https://img.shields.io/badge/UI-UIKit%20(programmatic)-2396F3"></a>
  <a href=".github/workflows/ci.yml"><img alt="CI" src="https://img.shields.io/badge/CI-GitHub%20Actions-2088FF?logo=githubactions&logoColor=white"></a>
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/License-MIT-green"></a>
</p>

---

## Overview

This repository is a teaching resource for developers who want to learn how to build UIKit
interfaces without Interface Builder. Each example is a standalone Xcode project that creates,
configures and lays out a single UIKit component in Swift, using the APIs that ship with the
current iOS SDK: `UIButton.Configuration`, `UIAction`, `AttributedString`, Auto Layout anchors,
Dynamic Type, dark mode aware system colors and the scene based app lifecycle.

Everything is deliberately small so that the interesting part — the component setup — stays
readable.

## Examples

| Example | What it demonstrates |
| --- | --- |
| [`LabelProgrammatically`](LabelProgrammatically) | Creating `UILabel`s in code, Dynamic Type with `adjustsFontForContentSizeCategory`, multiline text, rich text with `AttributedString`, and a reusable `InsetLabel` subclass that adds padding while respecting right-to-left layouts. |
| [`ButtonProgrammatically`](ButtonProgrammatically) | Modern `UIButton` setup with `UIButton.Configuration`, `UIAction` handlers instead of `#selector`, a `configurationUpdateHandler` that renders state (including the built-in activity indicator), an `async` task driven from a tap, and a pull-down `UIMenu` with single selection. |

### Highlights

- **Programmatic only.** No storyboards or XIBs: the launch screen and the scene manifest are
  generated from build settings, and each scene builds its own window and root view controller.
- **Auto Layout everywhere.** Views are positioned with layout anchors against
  `safeAreaLayoutGuide` and composed with `UIStackView`.
- **Swift 6 language mode.** Strict concurrency checking is enabled, with `MainActor` as the
  default actor isolation, so UI state is data-race safe by construction.
- **Accessible by default.** System colors for light/dark mode, Dynamic Type support and SF
  Symbols throughout.

## Requirements

| Tool | Version |
| --- | --- |
| Xcode | 26 or newer |
| Swift | 6.0 (Swift 6 language mode) |
| iOS deployment target | 18.0 |
| Devices | iPhone and iPad (`TARGETED_DEVICE_FAMILY = 1,2`) |

## Getting started

Clone the repository:

```bash
git clone https://github.com/halilozel1903/ioscomponentsprogrammatically.git
cd ioscomponentsprogrammatically
```

Open the example you are interested in:

```bash
open LabelProgrammatically/LabelProgrammatically.xcodeproj
# or
open ButtonProgrammatically/ButtonProgrammatically.xcodeproj
```

Select an iOS simulator and press <kbd>⌘</kbd> + <kbd>R</kbd>.

### Building from the command line

Both projects ship a shared scheme, so they build without opening Xcode:

```bash
xcodebuild build \
  -project LabelProgrammatically/LabelProgrammatically.xcodeproj \
  -scheme LabelProgrammatically \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO
```

### Linting and formatting

```bash
swiftlint lint          # rules in .swiftlint.yml
swift format lint -r .  # style in .swift-format
```

## Project structure

```text
.
├── ButtonProgrammatically/
│   ├── ButtonProgrammatically.xcodeproj
│   └── ButtonProgrammatically/
│       ├── AppDelegate.swift            # @main entry point, scene configuration
│       ├── SceneDelegate.swift          # builds the window and root view controller
│       ├── ButtonViewController.swift   # UIButton.Configuration, UIAction, UIMenu, async work
│       └── Assets.xcassets
├── LabelProgrammatically/
│   ├── LabelProgrammatically.xcodeproj
│   └── LabelProgrammatically/
│       ├── AppDelegate.swift
│       ├── SceneDelegate.swift
│       ├── LabelViewController.swift    # UILabel styling, AttributedString, stack layout
│       ├── InsetLabel.swift             # UILabel subclass with content insets
│       └── Assets.xcassets
├── .github/workflows/ci.yml             # builds both examples and runs SwiftLint
├── .swiftlint.yml
└── .swift-format
```

Both app targets use Xcode's file system synchronized groups, so files added to a target's folder
are picked up automatically without editing the project file.

## Contributing

Contributions are welcome. A good pull request:

1. Targets the `master` branch and keeps each example self-contained.
2. Builds cleanly for the iOS Simulator with no new warnings.
3. Passes `swiftlint lint`.
4. Uses small, focused commits with conventional subjects (`feat:`, `fix:`, `chore:`, `docs:`).

If you would like to add a new component example, follow the existing layout: one Xcode project
per component, an `AppDelegate`/`SceneDelegate` pair, and a single view controller that shows the
component being built in code.

## License

Released under the [MIT License](LICENSE).
