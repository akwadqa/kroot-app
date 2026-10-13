# [[PROJECT_NAME]]

> [[One or two sentences: what the app does and who it's for.]]

| | |
|---|---|
| Owner | [[NAME]] |
| Repo | [[REPO_URL]] |
| Design | [[FIGMA_URL]] |
| API docs | [[API_DOCS_URL]] |

---

## 1. Overview
- **Platforms:** [[Android / iOS]]
- **Languages:** [[ar, en]]
- **Main flows:**
  1. [[e.g. Login → OTP → Home]]
  2. [[FLOW]]

---

## 2. Architecture

```text
lib/
├── main.dart
├── features/
│   └── <feature>/
│       ├── data/            # models (freezed), datasources, repositories
│       └── presentation/
│           ├── controller/  # <name>_controller.dart + <name>_state.dart
│           ├── screens/
│           └── widgets/<screen>_page/
└── src/                     # network, routing, theme, utils, shared_widgets, localization
```

**Flow:** `Screen → Controller (Riverpod) → Repository → DataSource (Dio) → API`

**Rules:**
- Strings: `'key'.tr()` only. Never hard-code them.
- Colors: `AppColors` only.
- Text styles: `AppTextStyle.<font><Weight><Size>` (e.g. `rubikSemiBold18`).
- Widgets: small, named `ScreenName + Description`, in files named `<screen>_page_<widget>.dart`.

---

## 3. Features

| Feature | Description | Main controllers |
|---|---|---|
| [[auth]] | [[Login, OTP]] | [[AuthController]] |
| [[feature]] | [[DESCRIPTION]] | [[CONTROLLERS]] |

---

## 4. Riverpod

- Controllers use `@riverpod` (autoDispose by default).
- Use `@Riverpod(keepAlive: true)` for app-wide state and for anything that should be fetched once (session, location, ...).
- Use a family (`build(String? id)`) when create and edit flows need separate state.
- Each controller has a state class with an `init()` factory and `copyWith`.
- `ref.watch` is for building UI, `ref.read` is for callbacks, and `ref.listen` is for dialogs, toasts and navigation.

**Shared / keepAlive providers:**

| Provider | Purpose |
|---|---|
| [[provider]] | [[PURPOSE]] |

---

## 5. Freezed Models

- Models live in `features/<feature>/data/models/`.
- They use `@freezed` and `fromJson`, with `@JsonKey(name: '...')` for snake_case keys.

After any change to a model or provider, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 6. Setup

1. Flutter version: [[X.Y.Z]]
2. Get these files from [[NAME]]:
   - `.env`
   - `google-services.json`
   - `GoogleService-Info.plist`
3. Install, generate code and run:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

**`.env` keys:** [[API_BASE_URL]], [[MAPS_API_KEY]], [[...]]

---

## 7. Notes
[[Known issues, important decisions, anything a new developer should know.]]
