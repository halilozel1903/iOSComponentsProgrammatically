<h1 align="center">iOS Components Programmatically</h1>

<p align="center">
  UIKit sample apps that build their entire interface in Swift — no storyboards, no XIBs,
  and no manual <code>frame</code> layout.
</p>

<p align="center">
  <a href="#requirements"><img alt="Swift" src="https://img.shields.io/badge/Swift-6.3-F05138?logo=swift&logoColor=white"></a>
  <a href="#requirements"><img alt="Xcode" src="https://img.shields.io/badge/Xcode-26.6-1575F9?logo=xcode&logoColor=white"></a>
  <a href="#requirements"><img alt="Platform" src="https://img.shields.io/badge/iOS-26.0%2B-000000?logo=apple&logoColor=white"></a>
  <a href="#project-structure"><img alt="UI" src="https://img.shields.io/badge/UI-UIKit%20(programmatic)-2396F3"></a>
  <a href=".github/workflows/ci.yml"><img alt="CI" src="https://img.shields.io/github/actions/workflow/status/halilozel1903/ioscomponentsprogrammatically/ci.yml?branch=master&label=CI&logo=githubactions&logoColor=white"></a>
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/License-MIT-green"></a>
</p>

---

## Overview

This repository teaches **programmatic UIKit**: creating views in Swift, composing them with
Auto Layout and `UIStackView`, and applying modern APIs such as `UIButton.Configuration`,
`UIAction`, `AttributedString`, Dynamic Type, semantic system colors, haptics, and the
scene-based app lifecycle.

Each standalone Xcode project focuses on one component family. The **`ComponentsCatalog`**
app adds a searchable index that links every demo in a single navigation stack — a practical
pattern for sample apps and internal design systems.

## Features

- **Programmatic UI only** — launch screens and scene manifests come from build settings; view
  controllers own the full hierarchy.
- **Swift 6 language mode** — Swift 6.3 toolchain (Xcode 26.6) with strict concurrency and default `MainActor` isolation for UI code.
- **Accessibility & Dynamic Type** — preferred fonts, adjustable metrics, VoiceOver labels and
  hints on interactive controls.
- **Dark Mode** — semantic `UIColor` tokens (`.label`, `.systemBackground`, `.secondaryLabel`).
- **Haptics** — selection and impact feedback on catalog navigation and button demos.
- **Catalog app** — grouped table index with search, plus embedded demos for switches, sliders,
  segmented controls, progress views, and text fields.
- **Automated checks** — GitHub Actions builds all targets, runs catalog unit tests, SwiftLint,
  and `swift-format`.

## Examples

| Project | What it demonstrates |
| --- | --- |
| [`ComponentsCatalog`](ComponentsCatalog) | Searchable component index, navigation stack, haptics, and seven focused UIKit demos in one app. |
| [`LabelProgrammatically`](LabelProgrammatically) | `UILabel` styling, multiline text, UIKit `NSAttributedString`, Dynamic Type, and a reusable `InsetLabel` with directional padding. |
| [`ButtonProgrammatically`](ButtonProgrammatically) | `UIButton.Configuration`, `UIAction`, async work with configuration updates, `UIMenu` accent picking, and light haptic feedback. |

### Catalog demos (inside `ComponentsCatalog`)

| Screen | APIs highlighted |
| --- | --- |
| UILabel preview | `AttributedString`, inset labels, header traits |
| UIButton preview | Configurations, menus, impact haptics |
| UISwitch | `UIAction` on `.valueChanged`, success haptics |
| UISlider | Live value labels with Dynamic Type |
| UISegmentedControl | Single selection and semantic tint |
| UIProgressView | Async simulated upload with determinate progress |
| UITextField | Borderless fields, validation copy, keyboard types |

## Requirements

| Tool | Version |
| --- | --- |
| Xcode | 26.6 (stable; GitHub `macos-26` default) |
| Swift | 6 language mode on the Swift 6.3 toolchain (`SWIFT_VERSION = 6.0`) |
| iOS deployment target | 26.0 |
| Devices | iPhone and iPad (`TARGETED_DEVICE_FAMILY = 1,2`) |

> **Why not Xcode 27 / iOS 27 / Swift 6.4?** GitHub’s Xcode 27 images are still a public preview.
> This repo stays on the newest **stable** toolchain and SDK that `macos-26` runners ship
> (Xcode 26.6 / Swift 6.3 + iOS 26.x).

## Getting started

Clone the repository:

```bash
git clone https://github.com/halilozel1903/ioscomponentsprogrammatically.git
cd ioscomponentsprogrammatically
```

Open the sample you want to explore:

```bash
open ComponentsCatalog/ComponentsCatalog.xcodeproj
# or
open LabelProgrammatically/LabelProgrammatically.xcodeproj
open ButtonProgrammatically/ButtonProgrammatically.xcodeproj
```

Select an iOS simulator and press <kbd>⌘</kbd> + <kbd>R</kbd>.

> Tip: start with **ComponentsCatalog** to browse every demo from one entry point.

### Building from the command line

Shared schemes allow simulator builds without opening Xcode:

```bash
for example in ComponentsCatalog LabelProgrammatically ButtonProgrammatically; do
  xcodebuild build \
    -project "$example/$example.xcodeproj" \
    -scheme "$example" \
    -destination 'generic/platform=iOS Simulator' \
    CODE_SIGNING_ALLOWED=NO
done
```

Run catalog unit tests locally (GitHub Actions compiles the test target with `build-for-testing` because hosted runners do not ship iOS Simulator runtimes by default):

```bash
xcodebuild build-for-testing \
  -project ComponentsCatalog/ComponentsCatalog.xcodeproj \
  -scheme ComponentsCatalog \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO

# On a Mac with simulators installed, execute tests with:
xcodebuild test \
  -project ComponentsCatalog/ComponentsCatalog.xcodeproj \
  -scheme ComponentsCatalog \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  CODE_SIGNING_ALLOWED=NO
```

### Linting and formatting

```bash
swiftlint lint

swift format lint --recursive --strict LabelProgrammatically ButtonProgrammatically ComponentsCatalog
```

## Project structure

```text
.
├── ComponentsCatalog/
│   ├── ComponentsCatalog.xcodeproj
│   ├── ComponentsCatalog/                 # App sources (file-system synchronized)
│   │   ├── ComponentIndexViewController.swift
│   │   ├── Models/
│   │   ├── Support/
│   │   └── Demos/
│   └── ComponentsCatalogTests/            # XCTest target
├── ButtonProgrammatically/
│   ├── ButtonProgrammatically.xcodeproj
│   └── ButtonProgrammatically/
├── LabelProgrammatically/
│   ├── LabelProgrammatically.xcodeproj
│   └── LabelProgrammatically/
├── .github/workflows/ci.yml
├── .swiftlint.yml
└── .swift-format
```

App targets use Xcode file-system synchronized groups, so Swift files added under a target
folder are picked up automatically. Projects build in the Swift 6 language mode
(`SWIFT_VERSION = 6.0`) on the Swift 6.3 toolchain that ships with Xcode 26.6.

## Roadmap

- [ ] `UITextView` and `UISearchBar` demos with compositional layout helpers
- [ ] `UIControl` subclass example with custom configuration
- [ ] Snapshot tests for catalog cells in light and dark appearance
- [ ] SwiftUI preview-style hosting for selected UIKit demos (where useful for teaching)

## Contributing

Contributions are welcome. Please:

1. Branch from `master` and keep each example self-contained.
2. Ensure simulator builds succeed without new warnings.
3. Run `swiftlint lint` and `swift format lint --recursive --strict …` on touched folders.
4. Use small, conventional commits (`feat:`, `fix:`, `test:`, `docs:`, `chore:`).

New component examples should follow the existing layout: one Xcode project per focused sample,
or an additional screen inside `ComponentsCatalog` with accessibility labels and Dynamic Type.

## License

Released under the [MIT License](LICENSE).
