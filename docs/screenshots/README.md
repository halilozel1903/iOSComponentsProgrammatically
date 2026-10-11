# Screenshots

Checked-in assets are **SVG layout mocks** that mirror the three sample apps
(ComponentsCatalog index, LabelProgrammatically, ButtonProgrammatically). They are
intentional English illustrations — not binary PNGs fabricated from a simulator.

| File | Intended capture |
| --- | --- |
| `catalog-index.svg` | ComponentsCatalog — searchable UIKit Catalog index |
| `label-demo.svg` | LabelProgrammatically — headline, badge, attributed body |
| `button-demo.svg` | ButtonProgrammatically — configuration + accent menu |

## Replace with real simulator captures

On a Mac with Xcode 26.6+ and an iOS 26 simulator:

```bash
# Boot a simulator (example name — pick any available iPhone)
xcrun simctl boot "iPhone 17" || true
open -a Simulator

# Build & run an app (see the root README CLI section), then capture:
xcrun simctl io booted screenshot docs/screenshots/catalog-index.png
xcrun simctl io booted screenshot docs/screenshots/label-demo.png
xcrun simctl io booted screenshot docs/screenshots/button-demo.png
```

After adding PNGs, update the root [README.md](../../README.md) Screenshots section
to prefer the PNGs (keep the SVGs as fallbacks or remove them). Do not commit empty
or placeholder binary PNG files.
