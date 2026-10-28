# Access Web Page Example

A small Kotlin Multiplatform app that loads a web page and shows the text
matching a CSS selector (for example `title`, `body`, `a`).

## Structure

- `shared/src/commonMain/.../WebPageReader.kt` downloads the page with Ktor
  and extracts the text with Ksoup. Both platforms use this class.
- `androidApp/.../MainActivity.kt` is the Android UI.
- `iosApp/iosApp/ContentView.swift` is the iOS UI.

I used Ktor because it works on both platforms with a native HTTP engine,
and Ksoup because it can query HTML with CSS selectors, like jsoup.

## Running

- Android: run the `androidApp` configuration from Android Studio.
- iOS: open `iosApp/iosApp.xcodeproj` in Xcode and run it from there.