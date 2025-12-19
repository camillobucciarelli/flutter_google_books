# Esercizio 1 – Blog Posts (Lista → Dettaglio → Creazione)

## Obiettivo
Realizzare una mini applicazione Flutter che consenta di:
- visualizzare una lista di post
- accedere al dettaglio di un post
- creare un nuovo post tramite form reattivo

---

## API
JSONPlaceholder
https://jsonplaceholder.typicode.com

Endpoint:
- GET /posts
- GET /posts/{id}
- POST /posts

---

## Requisiti funzionali
- Lista dei post
- Dettaglio post
- Creazione post tramite **reactive_forms**
- Gestione loading ed errori

---

## Routing (go_router)
- /posts
- /posts/:id
- /posts/new

---

## Gestione del form (PostForm)
Il form di creazione deve includere:
- `title` (required, minLength: 3)
- `body` (required, minLength: 10)

Il submit deve:
- essere disabilitato se il form è invalido
- invocare il `CreatePostUseCase`

---

## Clean Architecture

### Domain
- Entity: Post
- Use case: CreatePostUseCase

### Presentation
- PostFormPage
- PostFormNotifier
- FormGroup definito nel notifier o nel widget
