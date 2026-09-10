# AGENTS.md

## Layout

Two standalone apps, no monorepo tooling (no workspaces, no shared config):

- `client/` — Angular 20 app (npm, zone.js change detection, standalone components). Root of Angular commands is `client/`, not the repo root.
- `server/` — ASP.NET Core (.NET 9) minimal API. C# project is `server/Server.csproj`.

There is no shared codegen, package boundary, or proxy between them (no `proxy.conf.json`, no CORS configured on the server yet).

## Toolchain

- Tooling comes from the nix flake (`flake.nix`): `nodejs` + `dotnet sdk 9.0`. Enter the shell with `nix develop`. The flake sets `DOTNET_ROOT` for you — outside that shell, `dotnet` requires `DOTNET_ROOT` to be set or it won't run.
- Node deps are installed per-package: `npm install` inside `client/`.

## Commands

- Client dev server: `npm start` (from `client/`, serves on :4200)
- Client build: `npm run build` (output in `client/dist/`)
- Client tests: `npm test` — Karma + Jasmine; requires a Chrome/Chromium binary on `PATH` (or `CHROME_BIN`), otherwise launch fails
- Server: `dotnet run` (from `server/`) — :5192 http / :7263 https per `Properties/launchSettings.json`; OpenAPI is mapped only in Development; sample request in `server/Server.http`
- Server has no test project
- No lint/typecheck/format scripts in `package.json`; TypeScript strictness comes from `client/tsconfig.json`. Prettier options live in `client/package.json` (printWidth 100, single quotes; `*.html` uses the `angular` parser).

## Per-app instruction files

- `client/AGENTS.md` — Angular/TS style rules for the client app (components, signals, templates, services)
- `server/AGENTS.md` — .NET rules, run/build commands, and stop conditions for the server

## Gotchas

- `client/node_modules`, `client/dist`, `client/.angular`, `server/bin`, `server/obj` are gitignored build artifacts — never edit or generate into them.
- Production build budget: initial bundle warning at 500kB / error at 1MB, per-component styles warning at 4kB / error at 8kB (`client/angular.json`).
- `skills-lock.json` and `.agents/skills/`, `.claude/skills/` are OpenCode/Claude skill manifests, not application code — leave them alone unless asked.

## Agent skills

### Issue tracker

Issues live as GitHub Issues in `sarisman84/book-site`, driven via the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

Default five-role vocabulary: `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`. See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: `CONTEXT.md` + `docs/adr/` at the repo root (neither exists yet; created lazily by `/domain-modeling`). See `docs/agents/domain.md`.
