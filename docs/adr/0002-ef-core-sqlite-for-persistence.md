# EF Core + SQLite for persistence

We use EF Core with SQLite (file-based) instead of an in-memory store or a managed database. SQLite survives restarts at zero cost, requires no database server on Render's free tier, and EF keeps the minimal-API surface thin. Reversing would mean swapping the provider and migration strategy, so the choice is made once, now.
