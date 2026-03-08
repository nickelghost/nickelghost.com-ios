# nickelghost.com iOS

A native iOS app version of [nickelghost.com](https://nickelghost.com) — a personal portfolio site. Simply a learning project, not supposed to be a proper app.

Built with SwiftUI, it fetches content from the live site's JSON endpoints and presents it with a custom dark theme and Poppins typography.

## Features

- **Home** — introduction with dynamically computed age and an optional link to [gingerfoto.com](https://gingerfoto.com)
- **Projects** — list of personal projects with images, tech stack, descriptions, and external links
- **Experience** — work history with company, role, tech stack, and employment dates
- Swipe-back gesture preserved with a custom back button
- Fully dark-mode UI with a custom colour palette

## Requirements

- Xcode 15+
- iOS 17+

## Getting Started

1. Clone the repository.
2. Open `nickelghost.com.xcodeproj` in Xcode.
3. Select a simulator or a connected device and press **Run** (⌘R).

No third-party dependencies or package manager setup is required.

## Architecture

The app is a straightforward SwiftUI project with no external dependencies.

| Layer          | Details                                                                                                   |
| -------------- | --------------------------------------------------------------------------------------------------------- |
| **Data**       | `NickelghostAPI` — static helpers that fetch JSON from `nickelghost.com` and decode it with `JSONDecoder` |
| **Models**     | `HomePage`, `Project`, `Workplace`, `RemoteImage` — plain `Codable` structs                               |
| **Views**      | `HomeView`, `ProjectsView`, `ExperienceView` — each owns its own fetch state                              |
| **Components** | `Card`, `CardList`, `CardLinks`, `WrapperView`, `CustomNavigationStack`, `CustomBackButton`               |
| **Extensions** | Custom `ShapeStyle` colours; `UINavigationController` patch to re-enable the swipe-back gesture           |

## Fonts

[Poppins](https://fonts.google.com/specimen/Poppins) is bundled under the SIL Open Font License (see `Fonts/Poppins/OFL.txt`).
