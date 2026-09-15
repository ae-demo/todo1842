# Domain Model

The core entities: a signed-in `User` owns `TodoList`s, shares them via `ListMembership`, and each list holds `Task`s carrying a due date and priority.

```mermaid
erDiagram
    USER ||--o{ TODOLIST : owns
    USER ||--o{ LISTMEMBERSHIP : "is member of"
    TODOLIST ||--o{ LISTMEMBERSHIP : "shared with"
    TODOLIST ||--o{ TASK : contains

    USER {
        string id PK
        string username
        string displayName
    }
    TODOLIST {
        string id PK
        string name
        string ownerId FK
        datetime createdAt
    }
    LISTMEMBERSHIP {
        string id PK
        string listId FK
        string userId FK
        string role "owner | collaborator"
    }
    TASK {
        string id PK
        string listId FK
        string title
        date dueDate
        string priority "low | medium | high"
        boolean done
        datetime createdAt
    }
```

- `USER` records are created/resolved from the Thunder-authenticated caller (id + username come from the identity token) rather than self-registered.
- `LISTMEMBERSHIP` carries `role` to distinguish the list owner (full management) from an invited collaborator (task edit rights only).
- `TASK.priority` is one of `low`, `medium`, `high`; `dueDate` is optional.

