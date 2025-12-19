# Esercizio 4 – Catalogo Prodotti

## Obiettivo
Catalogo prodotti con ricerca tramite form reattivo.

---

## API
Fake Store API  
https://fakestoreapi.com

---

## Routing
- /products
- /products/:id

---

## Gestione del form (SearchForm)

Il form di ricerca deve includere:
- `query` (minLength: 2)

Comportamento:
- Filtraggio client-side
- Aggiornamento reattivo della lista

---

## Clean Architecture

### Presentation
- ProductListPage
- SearchFormWidget
- FormGroup separato dalla lista
