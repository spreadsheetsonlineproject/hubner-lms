# International Translations

Translated content is placed in this table. Applications are going to use
the `label` as the identifier of the content and use the content of the `value`
field as the displayable text.

## Table Schema

> Table name: **international_translations**

| Field name                | Key | Description        | Type         | Default value | Required |
|---------------------------|:---:|--------------------|--------------|:-------------:|:--------:|
| id                        | PK  | Unique ID          | Integer      |       -       |    Y     |
| international_language_id | FK  | Language ID        | Integer      |       -       |    Y     |
| label                     |     | Content identifier | Varchar(255) |       -       |    Y     |
| value                     |     | Translated text    | Varchar(255) |       -       |    Y     |

## References

### Foreign Keys

1. The [international_language_id](TableInternationalLanguages.md) is the id of
   the language

## SQL Queries

### MsSQL

```SQL
CREATE TABLE international_translations (
    id INT PRIMARY KEY IDENTITY(1,1),
    international_language_id INT FOREIGN KEY REFERENCES international_languages(id),
    label NVARCHAR(255) UNIQUE NOT NULL
    value NVARCHAR(255) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id);
```

### PostgreSQL

```SQL
CREATE TABLE international_translations (
    id SERIAL PRIMARY KEY,
    international_language_id INT REFERENCES international_languages(id),
    label VARCHAR(255) UNIQUE NOT NULL,
    value VARCHAR(255) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id ON
    international_translations(international_language_id);
```