# Entities

## Example:Role

| Field                | Type       | Description                    | Values     |
| -------------------- | ---------- | ------------------------------ | ---------- |
| code                 | String     | Role Code/Name                 |            |
| level                | String     | Role Access Level              | 1, 2, 3    |

## Example:User

| Field                | Type       | Description                    | Values     |
| -------------------- | ---------- | ------------------------------ | ---------- |
| email                | String     | User Email                     |            |

## Example:User:Full

| Field                | Type       | Description                    | Values     |
| -------------------- | ---------- | ------------------------------ | ---------- |
| email                | String     | User Email                     |            |
| roles                | [[Example:Role](#examplerole)] | User Roles                     |            |

# Routes

## GET /api/v1/users

List Users

- **Returns**: List of [Example:User](#exampleuser)
- **Security**: `required=["admin/users.read"]`

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| filter               | Hash       | required: false                          |
| filter[email]        | [String]   | required: false                          |

## PUT /api/v1/users/:email

Update User

- **Returns**: [Example:User:Full](#exampleuserfull)

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| roles                | [JSON]     | required: false                          |
| roles[name]          | String     | required: true                           |
| email                |            |                                          |

