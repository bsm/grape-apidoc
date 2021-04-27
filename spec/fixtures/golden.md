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

## GET /api/v1/bars/:id

Get Bar

Required permissions: none.

Returns: [Mock::Bar::Entity](#mock--bar--entity)

Accepts:

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| id                   | N/A        |                                          |

## GET /api/v1/foos

List Foos

Required permissions: `foo/bar.baz`, `foo/bar.qux`

Returns: List of [Mock::Foo::Entity](#mock--foo--entity)

Accepts:

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| nested               | Hash       | required: false                          |
| nested[sub]          | N/A        | required: false                          |
| normal               | N/A        | required: false                          |
