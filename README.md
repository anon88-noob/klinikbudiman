KLINIK BUDIMAN V5 — BACKEND STARTER

Frontend:
  klinikbudiman.html

Production API expected by the frontend:
  POST   /api/auth/login
  POST   /api/auth/logout
  GET    /api/patients
  GET    /api/patients/:key
  POST   /api/visits
  DELETE /api/patients/:key
  POST   /api/import

Recommended production stack:
  PostgreSQL + Node.js/Express (or equivalent) + HTTPS + secure cookie/session authentication.

IMPORTANT:
  Do not use the demo credentials or DEMO_MODE for real patient information.
  Passwords must be hashed server-side (Argon2id/bcrypt), sessions must be secure,
  and authorization must be enforced on the backend for every endpoint.
