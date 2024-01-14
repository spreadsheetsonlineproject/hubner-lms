-- create the languages table
CREATE TABLE international_languages (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(8) NOT NULL,
    language NVARCHAR(20) NOT NULL
);

-- create the translations table
CREATE TABLE international_translations (
    id INT PRIMARY KEY IDENTITY(1,1),
    international_language_id INT FOREIGN KEY REFERENCES international_languages(id),
    label NVARCHAR(255) NOT NULL
    value NVARCHAR(255) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id);
