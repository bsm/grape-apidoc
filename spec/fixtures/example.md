# Entities

## Example:Role

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| name                 | String     | Role Name                                |

## Example:User

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| email                | String     | User Email                               |

## Example:User:Full

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| email                | String     | User Email                               |
| roles                | [[Example:Role](#example-role)] | User Roles                               |

# Routes

## GET /api/v1/users

List Users

- **Returns**: List of [Example:User](#example-user)
- **Security**: `required=["admin/users.read"]`

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| filter               | Hash       | required: false                          |
| filter[email]        | [String]   | required: false                          |

## PUT /api/v1/users/:email

Update User

- **Returns**: [Example:User:Full](#example-user-full)

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| roles                | [JSON]     | required: false                          |
| roles[name]          | String     | required: true                           |
| email                |            |                                          |

