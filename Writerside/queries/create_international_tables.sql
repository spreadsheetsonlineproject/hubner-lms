-- create the languages table
CREATE TABLE international_languages (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) NOT NULL,
    language VARCHAR(255) NOT NULL
);

-- create the labels table
CREATE TABLE international_labels (
    id INT PRIMARY KEY,
    usage_label NVARCHAR(MAX) NOT NULL
);

-- create the translations table
CREATE TABLE international_translations (
    id INT PRIMARY KEY,
    international_language_id INT FOREIGN KEY REFERENCES international_languages(id),
    international_label_id INT FOREIGN KEY REFERENCES international_labels(id),
    value NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id);
CREATE INDEX idx_international_translations_international_label_id on
    international_translations(international_label_id);