# Cross-site deployment with httpOnly auth cookies

The client ships to Netlify and the .NET 9 API to Render (both free tier), so the token lives in an `httpOnly` cookie marked `SameSite=None; Secure` with a credentialed CORS policy, rather than the simpler same-origin setup (server also serving the static build). Cross-site is deliberate: it mirrors the production shape, exercises real CORS/cookie semantics, and matches the spec-named hosts. Consequence: the exact client origin must be configured as an environment variable on the API for every deploy.
