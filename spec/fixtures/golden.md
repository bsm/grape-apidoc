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

Returns: [Mock::Bar::Entity](#mock--bar--entity)

## GET /api/v1/foos

List Foos

Returns: List of [Mock::Foo::Entity](#mock--foo--entity)
