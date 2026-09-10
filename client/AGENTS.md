# Client (Angular 20)

## TypeScript

- `strict` is on, along with `noImplicitOverride`, `noImplicitReturns`, `noFallthroughCasesInSwitch` (see `tsconfig.json`)
- Prefer type inference when the type is obvious
- Avoid `any`; use `unknown` when the type is uncertain

## Components

- Standalone components only — never set `standalone: true` in decorators (it's the default)
- Never use `@HostBinding`/`@HostListener`; put host bindings in the `host` object of the `@Component`/`@Directive` decorator
- Use `input()`/`output()` functions, not decorators
- Set `changeDetection: ChangeDetectionStrategy.OnPush` in `@Component`
- Keep components small and focused on a single responsibility
- Prefer inline templates for small components
- Do NOT use `ngClass`/`ngStyle`; use `class`/`style` bindings instead
- Use `NgOptimizedImage` for all static images (does not work for inline base64 images)

## State & services

- Signals for local state; `computed()` for derived state; never `mutate` — use `set`/`update`
- Prefer reactive forms over template-driven forms
- Services: `providedIn: 'root'` for singletons, single responsibility
- Use `inject()`, not constructor injection

## Templates

- Native control flow (`@if`, `@for`, `@switch`), not `*ngIf`/`*ngFor`/`*ngSwitch`
- Keep templates simple; no complex logic
- Async pipe for observables

## Routes

- Lazy load feature routes
