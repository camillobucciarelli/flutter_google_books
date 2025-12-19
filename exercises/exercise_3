# Esercizio 3 – Todo CRUD

## Obiettivo
Gestire CRUD completo con form reattivo riutilizzabile.

---

## API
JSONPlaceholder

Endpoint:
- GET /todos
- POST /todos
- PUT /todos/{id}

---

## Routing
- /todos
- /todos/new
- /todos/:id/edit

---

## Gestione del form (TodoForm)

Il form deve essere **lo stesso** per create e edit.

Campi:
- `title` (required, minLength: 3)
- `completed` (boolean)

Requisiti:
- Pre-compilazione in modalità edit
- Submit condizionato alla validità

---

## Clean Architecture

### Presentation
- TodoFormPage
- TodoFormNotifier
- FormGroup costruito dinamicamente (create vs edit)
