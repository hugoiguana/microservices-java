

CREATE SCHEMA IF NOT EXISTS prod;

CREATE TABLE prod.product
(
    id UUID PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR,
    dt_criation TIMESTAMP,
    dt_modification TIMESTAMP,
    deleted BOOL
);
