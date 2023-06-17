-- create schemas
CREATE SCHEMA source;
CREATE SCHEMA destination;

-- create source tables
CREATE TABLE source.table_a (
    id serial primary key,
    column_1 varchar,
    column_2 varchar,
    column_3 varchar
);

-- create replication slot & publication
SELECT pg_create_logical_replication_slot('airbyte_slot', 'pgoutput');

CREATE PUBLICATION airbyte_publication FOR TABLE source.table_a;

-- add initial records
INSERT INTO source.table_a (column_1, column_2, column_3)
VALUES
('foo1', 'foo2', 'foo3'),
('bar1', 'bar2', 'bar3'),
('baz1', 'baz2', 'baz3');
