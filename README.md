# FourthWeekSwift

A focused Week‑4 iOS learning project built with **SwiftUI** and **MVVM**. This app opens with a features list; tapping a row navigates to a self‑contained demo screen. The week’s themes are **loading/error/empty UI states**, **robust JSON decoding with HTTP status handling**, **MVVM refactor patterns**, **SwiftUI animations**, and **Accessibility (Dynamic Type + VoiceOver)** — finishing with a mini demo you can share on GitHub.

---

## ✨ Features

* **Features List Home** — simple router to all demos via `NavigationStack`.
* **Loading / Error / Empty States** — toggle success/empty and show overlays, placeholders, and retry.
* **JSON Decoding & Status Codes** — simulate HTTP status ranges (2xx/4xx/5xx) and decode sample payloads safely.
* **MVVM Deep Dive (Refactor)** — tiny counter flow showing clear **Model / ViewModel / View** responsibilities.
* **SwiftUI Animations** — fade + move transitions with `withAnimation`.
* **Accessibility Demo** — Dynamic Type, VoiceOver labels/values/hints, and decorative image handling.
* **Review & Share** — `ShareLink` for quick repo sharing.

---

## 🧱 Tech Stack

* **Language:** Swift 5+
* **UI:** SwiftUI (iOS 16+)
* **Architecture:** MVVM (ObservableObject, @Published state)
* **Navigation:** NavigationStack + type‑safe routing enum

> This repo is intentionally lightweight and self‑contained. It simulates network calls locally so you can focus on app behavior.

---

## 📂 Project Structure (suggested)

```
FourthWeekSwift/
├─ FourthWeekSwiftApp.swift         # App entry
├─ Models/
│  ├─ FeatureRoute.swift
│  └─ FeatureRowItem.swift
├─ ViewModels/
│  ├─ FeaturesViewModel.swift
│  └─ (feature-specific VMs)
├─ Views/
│  ├─ FeaturesListView.swift
│  ├─ LoadingErrorEmptyView.swift
│  ├─ JSONDecodingStatusView.swift
│  ├─ MVVMRefactorView.swift
│  ├─ AnimationsDemoView.swift
│  └─ AccessibilityDemoView.swift
└─ Utils/ (optional)
```

---

## 🚀 Getting Started

### Requirements

* **Xcode 15+**
* **iOS 16+**

### Run

1. Clone:

   ```bash
   git clone https://github.com/garry007/FourthWeekSwift.git
   ```
2. Open `FourthWeekSwift.xcodeproj` (or the `.xcworkspace` if you add packages) in Xcode.
3. Build & Run on iPhone simulator or device.

---

## 🧪 Feature Notes

### 1) Loading / Error / Empty States

* Simulated fetch with `DispatchQueue.main.asyncAfter`.
* Overlay **ProgressView** while loading.
* Show **empty placeholder** or **error card** with Retry.
* Toggle inputs to simulate success/empty.

```swift
@Published private(set) var state: FetchState = .idle
// .loading → .loaded([items]) | .empty | .error(message)
```

**Why it matters:** Most real screens live in these states; practicing them early avoids brittle UIs later.

---

### 2) JSON Decoding & Status Codes

* Slider to pick a status code (200–599) and simulate responses.
* Guard non‑2xx before decoding; show friendly messages for 4xx/5xx.
* Demonstrates safe `Decodable` + error surfaces.

```swift
switch statusCode {
case 200...299: /* decode */
case 400...499: /* client error */
case 500...599: /* server error */
default: break
}
```

**Tip:** In a real app, map API error bodies to an `APIError` model and display actionable guidance.

---

### 3) MVVM Deep Dive (Refactor)

* Minimal counter example:

  * **Model:** `CounterState`
  * **ViewModel:** `CounterViewModel` with intent methods (`increment/decrement/reset`)
  * **View:** Binds to `@Published` state; no business logic in views.

**Why it matters:** Clear separation keeps views declarative and testable.

---

### 4) SwiftUI Animations

* Uses `.transition(.opacity.combined(with: .move(edge: .bottom)))`.
* `withAnimation(.easeInOut(duration: 0.45))` around state toggle.

**Why it matters:** Tiny motion wins = big perceived quality.

---

### 5) Accessibility

* **Dynamic Type:** system text styles scale automatically.
* **VoiceOver:** labels, values, and hints for controls.
* **Decorative images:** `accessibilityHidden(true)`.

**Why it matters:** Accessibility is quality. Bake it in.

---

## 🗺️ Week 4 iOS Schedule (context)

* **Nov 07, 2025:** Loading, error, and empty states
* **Nov 08, 2025:** JSON decoding and status codes
* **Nov 09, 2025:** MVVM deep dive — refactor
* **Nov 10, 2025:** SwiftUI animations — fade/move
* **Nov 11, 2025:** Accessibility — Dynamic Type & VoiceOver
* **Nov 12, 2025:** Review + share mini demo on GitHub

> Backend tasks (Dockerize FastAPI, docker‑compose, Render deploy, health checks) are tracked in a separate backend repo. This iOS repo stays UI/architecture‑focused.

---

## 🔧 Extending This Repo

* Replace simulated JSON with `URLSession` or `AsyncHTTPClient`.
* Add a real `Endpoint` layer (method/path/headers/decoders) and a `NetworkClient` with dependency injection.
* Extract a shared **Loadable** state enum for consistency across screens.
* Add unit tests for ViewModels using `XCTest`.

---

## 📸 Screenshots (add later)

* `FeaturesListView`
* `LoadingErrorEmptyView` (loading, empty, error)
* `JSONDecodingStatusView` (2xx vs 4xx vs 5xx)
* `AnimationsDemoView`
* `AccessibilityDemoView`

> Save in `Docs/` and update this section with images.

---

## 🤝 Contributing

Issues and PRs welcome. This is a learning series repo (`FirstWeekSwift`, `SecondWeekSwift`, `ThirdWeekSwift`, `FourthWeekSwift`).

---

## 📄 License

MIT — do whatever you want; attribution appreciated.
