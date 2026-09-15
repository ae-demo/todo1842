screen Lists "The lists a user owns or belongs to"
  navbar "Todo"
  heading "My Lists"
  row
    search "Search lists"
    right
    button "New List" primary -> NewListForm
  table "Name | Role | Tasks"
    row "Groceries | owner | 5"
    row "Roadtrip | collaborator | 3" -> ListDetail

screen NewListForm "Create a new list"
  navbar "Todo"
  heading "New List"
  input "List name"
  row
    right
    button "Cancel" -> Lists
    button "Create" primary -> ListDetail

screen ListDetail "Tasks on a single list, sorted and filtered"
  navbar "Todo"
  heading "Groceries"
  row
    select "Sort: Due date | Priority"
    select "Filter: All | Low | Medium | High"
    right
    link "Collaborators" -> Collaborators
    button "Add Task" primary -> TaskForm
  table "Done | Title | Due Date | Priority"
    row "\u2610 | Buy milk | 2026-09-20 | high"
    row "\u2611 | Buy bread | 2026-09-18 | low" -> TaskForm

screen TaskForm "Add or edit a task"
  navbar "Todo"
  heading "Task"
  input "Title"
  input "Due date"
  select "Priority: Low | Medium | High"
  row
    right
    button "Cancel" -> ListDetail
    button "Save" primary -> ListDetail

screen Collaborators "Who has access to this list"
  navbar "Todo"
  heading "Collaborators"
  row
    input "Invite by username"
    button "Invite" primary // adds the collaborator and stays on this screen
  table "Username | Role | "
    row "alice | owner | "
    row "bob | collaborator | Remove"

flow "Manage lists and tasks"
  role "User"
  description "A user creates lists, invites collaborators, and manages tasks"
  Lists
  NewListForm
  ListDetail
  TaskForm
  Collaborators
