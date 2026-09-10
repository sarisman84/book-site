# Server (ASP.NET Core, .NET 9)

## Hard rules

- Follow ASP.NET Core / .NET 9 conventions
- Nullable reference types are enabled (`Server.csproj`) — always respect them

## Setup / run

- `dotnet run` (from `server/`) — :5192 http, :7263 https per `Properties/launchSettings.json`
- `dotnet build` to build
- OpenAPI is mapped only in Development
- No test project exists — do not suggest or run `dotnet test`

## Style

- Minimal-API style as in `Program.cs`: endpoint mapping in `Program.cs`, record types for DTOs, implicit usings enabled
- Sample request file: `Server.http`

## Stop conditions

- If requirements for new endpoints are ambiguous
- If breaking changes to the project structure are needed

## Reference

- ASP.NET Core docs: https://learn.microsoft.com/aspnet/core
