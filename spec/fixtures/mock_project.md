# Entities

## Mock:Role

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| name                 | String     | Role Name                                |

## Mock:User

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| email                | String     | User Email                               |

## Mock:User:Full

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| email                | String     | User Email                               |
| roles                | [[Mock:Role](#mock-role)] | User Roles                               |

# Routes

## GET /api/v1/users

List Users

- **Returns**: List of [Mock:User](#mock-user)
- **Security**: `required=["admin/users.read"]`

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| filter               | Hash       | required: false                          |
| filter[email]        | [String]   | required: false                          |

## PUT /api/v1/users/:email

Update User

- **Returns**: [Mock:User:Full](#mock-user-full)

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| roles                | [JSON]     | required: false                          |
| roles[name]          | String     | required: true                           |
| email                |            |                                          |

