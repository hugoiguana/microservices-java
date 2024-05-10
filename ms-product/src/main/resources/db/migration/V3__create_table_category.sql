

CREATE TABLE prod.category
(
    id UUID PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR,
    dt_criation TIMESTAMP,
    dt_modification TIMESTAMP,
    deleted BOOL
);


--insert into prod.category(id, name, description, dt_criation, dt_modification)
--values(uuid_generate_v4(), lower('smartphones'), 'Smartphones', current_timestamp, current_timestamp);

insert into prod.category(id, name, description, dt_criation, dt_modification)
values('5472f957-8d95-4e4f-a084-8cd9193b1fd0', lower('smartphones'), 'Smartphones', current_timestamp, current_timestamp);

