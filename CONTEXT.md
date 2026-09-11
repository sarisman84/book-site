# Book Site

A responsive web application where users maintain a shared catalog of books and keep a personal list of favorite quotes, with JWT-backed authentication.

## Language

### The book catalog

**Book**:
A shared catalog entry: title, author, publication date, and an optional description.
_Avoid_: item, entry

**Book owner**:
A User's peer relationship to a Book. Every Book has at least one Book owner; editing, deleting, and changing ownership require Book owner status.
_Avoid_: creator, manager, admin

### Account & authentication

**User**:
An authenticated member of the application, identified by username with a hash-stored password.
_Avoid_: customer, account

**Access token**:
The short-lived token a User presents with each API request to prove authentication.
_Avoid_: JWT (when contrasted with the refresh token)

**Refresh token**:
The long-lived token that exchanges for a new Access token. Rotates on each use; becomes invalid on logout.
_Avoid_: session cookie

**Session**:
The live state of a logged-in User: a valid Access token plus at least one unexpired, unrotated Refresh token.
_Avoid_: login, account state

### Personal data

**Quote**:
A User's personal favorite quote: a text and an author. Quotes belong to exactly one User.
_Avoid_: note, pin

### Presentation

**Language**:
The UI language the User has chosen (Swedish or English), independent of browser default.
_Avoid_: locale

**Theme**:
The visual mode of the UI: light or dark.
_Avoid_: color scheme, mode
