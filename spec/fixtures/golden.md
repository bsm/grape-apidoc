# Entities

## Mock::Bar::Entity

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| bar_id               | Integer    | Bar ID                                   |

## Mock::Foo::Entity

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| foo_id               | Integer    | Foo ID                                   |

# Routes

## GET /api/v1/foos

List Foos

- **Returns**: List of [Mock::Foo::Entity](#mock--foo--entity)
- **Security**: required: ["foo/bar.baz", "foo/bar.qux"]

**Accepts**:

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| normal               | N/A        | required: false                          |
| nested               | Hash       | required: false                          |
| nested[sub]          | N/A        | required: false                          |

## GET /api/v1/bars/:id

Get Bar

- **Returns**: [Mock::Bar::Entity](#mock--bar--entity)

**Accepts**:

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| id                   | N/A        |                                          |

