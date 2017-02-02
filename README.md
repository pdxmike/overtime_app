# Overtime App

#### Key Requirements: Company needs documentation that salaried employees did or did not get overtime each week

## Models
- ~~Post -> date:date rationale:text~~
- ~~User -> Devise~~
- ~~AdminUser -> STI~~

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- ~~Admin Dashboard~~
- ~~Block non-admin from viewing admin dashboard~~
- Block non-admin users from seeing admin navigation options
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI
- ~~Bootstrap~~
- ~~Update Form Styling~~

## Refactor Todos
- ~~Add full_name method for users~~
- Refactor user association integration test in post_spec
- Modify post_spec:82 to use Factory
- Modify post_spec:53 to use correct user reference without requiring .update
