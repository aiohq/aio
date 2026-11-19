# TypeScript, Electron, and Effect

aio is written in TypeScript, ships on the desktop as an Electron app, and handles errors and concurrency with Effect. TypeScript comes from the ecosystem. The agent generates the interactive lessons as HTML, CSS, and JS during the session, and a design system lesson shows real web components. Pi (`@earendil-works/pi-*`) already ships in TypeScript the durable harness and access to several model providers. Electron comes from Pi: the subscription login, where the learner signs in with a ChatGPT or Claude subscription instead of an API key, runs only in Node. The Node environment of `pi-durable` and its shell execution are Node-only too. Electron runs Node and the Chromium that renders the lessons in one app.

## Why Effect

aio depends on the network at every step, because each tutor answer is a stream from a model provider. The failures that matter are network failures: a dropped stream, a rate limit, a provider timeout, and a learner who interrupts the tutor mid-answer. Effect puts those errors in the type of each function, so an unhandled case fails the build. It also ships retry with backoff, timeouts, and cancellation. aio wraps the Pi calls in Effect at the boundary, and the strict flags in `tsconfig.json` cover the rest of the code.

Effect and the strict compiler give aio part of what Rust would enforce: errors in the signature, exhaustive matches, and no unchecked `undefined`. The cost is the learning curve. Effect code reads like its own dialect of TypeScript, for people and for agents.

## Considered options

- **Rust with a native UI (iced, gpui, or ratatui)**: rejected. A compiled UI cannot display the interactivity that the agent generates on the fly, and the project would have to reimplement the durability and the provider layer that Pi already has.
- **Rust for the harness and lessons in a webview (Tauri)**: rejected. The project would have two languages, and the time would go to rewriting Pi instead of working on the teaching method.
- **Tauri v2 with Pi inside the webview**: rejected. `pi-ai` and `pi-agent-core` run in a browser, but the OAuth login flows are Node-only, so the learner could use only an API key. aio would also have to write the `pi-durable` environment on top of the Tauri fs plugin, with no shell execution.
- **Tauri v2 with Pi in a Node sidecar**: rejected. The app ships Node anyway, so the size advantage of Tauri shrinks. The app runs as two processes that talk over IPC, adds Rust to the project, and still does not reach the iPhone, because iOS does not let an app start another process.
- **React Native or Expo**: rejected. The lessons are web pages, so React Native would show them in a webview anyway. Its JavaScript runtime is not Node, so the subscription login would not run.

## Consequences

- Electron bundles Chromium and Node, so the installer and the memory use are larger than those of a Tauri app.
- Electron does not run on Android or iOS, so the mobile app stays undecided. The Pi team takes this path in `apps/p3`: a Pi server on the learner's machine, with the phone as a web client. A later ADR decides the mobile app when the Android tablet becomes the next target.
