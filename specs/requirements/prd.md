# todo1842 — PRD

## Problem Statement

People juggling personal errands and shared responsibilities (household chores, small team projects, trip planning) end up splitting their to-dos across sticky notes, chat threads, and separate apps that nobody else can see. There is no lightweight, shared place where a group can see the same list, know what's done, and know what's urgent.

## Solution

A web-based to-do app where a signed-in user creates lists, works tasks solo or invites others onto a list to collaborate, and every task carries a due date and priority so the group can see what matters most.

## Actors

- **User** — any signed-in person. Creates and owns lists, invites other users to collaborate on a list, and adds, edits, completes, and deletes tasks on any list they belong to (as owner or invited collaborator).

## User Stories

1. As a user, I want to sign in securely, so that my lists and tasks are private to me and the people I choose to share with.
2. As a user, I want to create a to-do list, so that I can organize tasks by project, household, or context.
3. As a user, I want to invite another user to a list by their username, so that we can work the same tasks together.
4. As a user, I want to add a task to a list with a title, due date, and priority, so that I can track what needs doing and how urgent it is.
5. As a user, I want to mark a task as done or not done, so that the list reflects real progress.
6. As a user, I want to edit or delete a task, so that the list stays accurate as things change.
7. As a user, I want to view a list's tasks sorted or filtered by due date or priority, so that I can focus on what's most urgent.
8. As a user, I want to see who else has access to a shared list, so that I know who I'm collaborating with.
9. As a user, I want to remove a collaborator from a list I own, or leave a list someone else owns, so that access stays current.
10. As a user, I want to delete a list I own, so that I can remove lists I no longer need.

## Product Decisions

- Sign-in is via Thunder, the platform SSO — every user authenticates through it before seeing any list (org default).
- Any user can create a list and becomes its owner; only the owner can invite or remove collaborators or delete the list.
- A list owner invites a collaborator by the collaborator's username/handle.
- An invited collaborator has full edit rights on the list's tasks (add, edit, complete, delete) but cannot invite others, remove collaborators, or delete the list.
- No email or push notifications in this version — invites and changes are visible only when the user is in the app.
- Tasks carry a title, an optional due date, and a priority level (low / medium / high) *assumed*.

## Out of Scope

- Sub-tasks / checklists within a task.
- Recurring or repeating tasks.
- Comments or activity history on tasks.
- Mobile native apps (web only).
- Public/anonymous access — every user must sign in.

## Open Questions

(none — remaining decisions were assumed and are listed above)

## Further Notes

None.

