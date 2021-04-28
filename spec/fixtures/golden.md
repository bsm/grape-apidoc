# Entities

## Mock::Bar::Entity

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| bar_id               | Integer    | Bar ID                                   |
| foos                 | [Object]   | Associated Foos                          |

## Mock::Foo::Entity

| Field                | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| foo_id               | Integer    | Foo ID                                   |

# Routes

## GET /api/v1/foos

List Foos

- **Returns**: List of [Mock::Foo::Entity](#mock--foo--entity)
- **Security**: required: ["foo/bar.baz", "foo/bar.qux"]

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| filter               | Array      | required: false                          |
| filter[foo_id]       | [Integer]  | required: false                          |

## POST /api/v1/bars/:id

Create Bar

- **Returns**: [Mock::Bar::Entity](#mock--bar--entity)

**Parameters**:

| Parameter            | Type       | Description                              |
| -------------------- | ---------- | ---------------------------------------- |
| foos                 | [JSON]     | required: false                          |
| foos[foo_id]         | Integer    | required: false                          |
| id                   |            |                                          |

