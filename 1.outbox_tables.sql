create table message
(
    id                varchar(255)                        not null
        primary key,
    destination       longtext                            not null,
    headers           longtext collate utf8mb4_unicode_ci not null,
    payload           longtext collate utf8mb4_unicode_ci not null,
    published         smallint default 0                  null,
    message_partition smallint                            null,
    creation_time     bigint                              null
);

create index message_published_idx
    on message (published, id);

create table received_messages
(
    consumer_id   varchar(255)       not null,
    message_id    varchar(255)       not null,
    creation_time bigint             null,
    published     smallint default 0 null,
    primary key (consumer_id, message_id)
);