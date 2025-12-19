# Esercizio 5 – App Eventi con Onboarding e Auth

## Obiettivo
Applicazione completa con onboarding, login e creazione eventi.

---

## Routing
- /onboarding
- /login
- /events
- /events/new

---

## Gestione del form (EventForm)

Il form di creazione evento deve includere:
- `title` (required, minLength: 5)
- `description` (required, minLength: 20)
- `date` (required)

Requisiti:
- Validazione reattiva
- Submit solo se valido
- Invocazione CreateEventUseCase

---

## Clean Architecture

### Presentation
- EventFormPage
- EventFormNotifier
- Stato globale per redirect

---

## Vincoli avanzati
- Tutti i form devono usare `ReactiveForm`
- Nessun accesso diretto ai repository dal form
