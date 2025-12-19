# Esercizio 2 – Autenticazione e Area Protetta

## Obiettivo
Gestire un flusso di autenticazione con form reattivo e rotte protette.

---

## API
ReqRes
https://reqres.in/api

Endpoint:
- POST /login
- GET /users
- GET /users/{id}

---

## Requisiti funzionali
- Login tramite form reattivo
- Accesso protetto alle rotte utenti
- Logout

---

## Routing
- /login
- /users
- /users/:id

---

## Gestione del form (LoginForm)

Il form di login deve includere:
- `email` (required, email)
- `password` (required, minLength: 6)

Comportamento:
- Submit disabilitato se invalido
- Mostrare errore API se login fallisce

---

## Clean Architecture

### Domain
- LoginUseCase

### Presentation
- LoginPage
- LoginNotifier
- ReactiveFormConsumer
