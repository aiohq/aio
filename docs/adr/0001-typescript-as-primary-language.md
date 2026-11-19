# TypeScript as the primary language

aio uses TypeScript as its primary language because of the ecosystem. The interactive lessons are web pages, because the agent generates HTML, CSS, and JS during the session, and a design system lesson shows real web components. Pi (`@earendil-works/pi-*`) already ships in TypeScript the durable harness, access to several model providers, and the web clients. That way the same code runs on the desktop, the first target, and later on an Android tablet and on the iPhone.

## Considered options

- **Rust with a native UI (iced, gpui, or ratatui)**: rejected. A compiled UI cannot display the interactivity that the agent generates on the fly, and the project would have to reimplement the durability and the provider layer that Pi already has.
- **Rust for the harness and lessons in a webview (Tauri)**: rejected. The project would have two languages, and the time would go to rewriting Pi instead of working on the teaching method.
