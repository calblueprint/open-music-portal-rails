--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE announcements (
    id integer NOT NULL,
    description text,
    admin_id integer,
    date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE announcements_id_seq OWNED BY announcements.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    body character varying(255),
    judge_id integer,
    contestant_id integer,
    event_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: composers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE composers (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: composers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE composers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: composers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE composers_id_seq OWNED BY composers.id;


--
-- Name: contestants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contestants (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contestants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contestants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contestants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contestants_id_seq OWNED BY contestants.id;


--
-- Name: event_ranks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE event_ranks (
    id integer NOT NULL,
    rank integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: event_ranks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_ranks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_ranks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_ranks_id_seq OWNED BY event_ranks.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    start_time time without time zone,
    room_id integer
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: events_judges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events_judges (
    id integer NOT NULL,
    event_id integer,
    judge_id integer
);


--
-- Name: events_judges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_judges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_judges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_judges_id_seq OWNED BY events_judges.id;


--
-- Name: events_pieces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events_pieces (
    event_id integer NOT NULL,
    piece_id integer NOT NULL
);


--
-- Name: events_transactions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events_transactions (
    event_id integer,
    transaction_id integer
);


--
-- Name: events_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events_users (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL,
    paid boolean DEFAULT false
);


--
-- Name: events_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_users_id_seq OWNED BY events_users.id;


--
-- Name: judges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE judges (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: judges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE judges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: judges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE judges_id_seq OWNED BY judges.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE levels (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE levels_id_seq OWNED BY levels.id;


--
-- Name: nationalities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nationalities (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nationalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nationalities_id_seq OWNED BY nationalities.id;


--
-- Name: periods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE periods (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: periods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE periods_id_seq OWNED BY periods.id;


--
-- Name: pieces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pieces (
    id integer NOT NULL,
    composer_id integer,
    nationality_id integer,
    title text,
    book_id integer,
    publisher_id integer,
    affiliate_link text,
    length_minutes integer,
    length_seconds integer,
    period_id integer,
    pages text,
    level_id integer,
    other_a text,
    other_b text,
    other_c text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pieces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pieces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pieces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pieces_id_seq OWNED BY pieces.id;


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE publishers (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE publishers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE publishers_id_seq OWNED BY publishers.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rooms (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transactions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    amount integer NOT NULL,
    charged boolean DEFAULT false,
    charged_at timestamp without time zone,
    stripe_charge_id text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    id_number integer,
    date_of_birth date,
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    password_digest character varying(255),
    country character varying(255),
    street_address character varying(255),
    city character varying(255),
    state character varying(255),
    zip_code character varying(255),
    phone_number character varying(255),
    remember_token character varying(255),
    password_reset_token character varying(255),
    password_reset_sent_at timestamp without time zone,
    confirmed boolean DEFAULT false,
    confirmation_token character varying(255)
);


--
-- Name: users_admins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_admins (
    user_id integer,
    admin_id integer
);


--
-- Name: users_contestants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_contestants (
    user_id integer,
    contestant_id integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_judges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_judges (
    user_id integer,
    judge_id integer
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY announcements ALTER COLUMN id SET DEFAULT nextval('announcements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY composers ALTER COLUMN id SET DEFAULT nextval('composers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contestants ALTER COLUMN id SET DEFAULT nextval('contestants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_ranks ALTER COLUMN id SET DEFAULT nextval('event_ranks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_judges ALTER COLUMN id SET DEFAULT nextval('events_judges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_users ALTER COLUMN id SET DEFAULT nextval('events_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY judges ALTER COLUMN id SET DEFAULT nextval('judges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY levels ALTER COLUMN id SET DEFAULT nextval('levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nationalities ALTER COLUMN id SET DEFAULT nextval('nationalities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY periods ALTER COLUMN id SET DEFAULT nextval('periods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pieces ALTER COLUMN id SET DEFAULT nextval('pieces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY publishers ALTER COLUMN id SET DEFAULT nextval('publishers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: composers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY composers
    ADD CONSTRAINT composers_pkey PRIMARY KEY (id);


--
-- Name: contestants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contestants
    ADD CONSTRAINT contestants_pkey PRIMARY KEY (id);


--
-- Name: event_ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY event_ranks
    ADD CONSTRAINT event_ranks_pkey PRIMARY KEY (id);


--
-- Name: events_judges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events_judges
    ADD CONSTRAINT events_judges_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: events_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events_users
    ADD CONSTRAINT events_users_pkey PRIMARY KEY (id);


--
-- Name: judges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY judges
    ADD CONSTRAINT judges_pkey PRIMARY KEY (id);


--
-- Name: levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nationalities
    ADD CONSTRAINT nationalities_pkey PRIMARY KEY (id);


--
-- Name: periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);


--
-- Name: pieces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pieces
    ADD CONSTRAINT pieces_pkey PRIMARY KEY (id);


--
-- Name: publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_admins_on_name ON admins USING btree (name);


--
-- Name: index_admins_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_admins_on_name_and_resource_type_and_resource_id ON admins USING btree (name, resource_type, resource_id);


--
-- Name: index_contestants_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contestants_on_name ON contestants USING btree (name);


--
-- Name: index_contestants_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contestants_on_name_and_resource_type_and_resource_id ON contestants USING btree (name, resource_type, resource_id);


--
-- Name: index_judges_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_judges_on_name ON judges USING btree (name);


--
-- Name: index_judges_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_judges_on_name_and_resource_type_and_resource_id ON judges USING btree (name, resource_type, resource_id);


--
-- Name: index_users_admins_on_user_id_and_admin_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_admins_on_user_id_and_admin_id ON users_admins USING btree (user_id, admin_id);


--
-- Name: index_users_contestants_on_user_id_and_contestant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_contestants_on_user_id_and_contestant_id ON users_contestants USING btree (user_id, contestant_id);


--
-- Name: index_users_judges_on_user_id_and_judge_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_judges_on_user_id_and_judge_id ON users_judges USING btree (user_id, judge_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX users_email_idx ON users USING gin (email gin_trgm_ops);


--
-- Name: users_first_name_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX users_first_name_idx ON users USING gin (first_name gin_trgm_ops);


--
-- Name: users_last_name_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX users_last_name_idx ON users USING gin (last_name gin_trgm_ops);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130927022742');

INSERT INTO schema_migrations (version) VALUES ('20130927023130');

INSERT INTO schema_migrations (version) VALUES ('20130927070704');

INSERT INTO schema_migrations (version) VALUES ('20130927070849');

INSERT INTO schema_migrations (version) VALUES ('20130927070854');

INSERT INTO schema_migrations (version) VALUES ('20130927070858');

INSERT INTO schema_migrations (version) VALUES ('20130927070902');

INSERT INTO schema_migrations (version) VALUES ('20130927070907');

INSERT INTO schema_migrations (version) VALUES ('20130928230942');

INSERT INTO schema_migrations (version) VALUES ('20130928234517');

INSERT INTO schema_migrations (version) VALUES ('20131008070441');

INSERT INTO schema_migrations (version) VALUES ('20131013004809');

INSERT INTO schema_migrations (version) VALUES ('20131021115033');

INSERT INTO schema_migrations (version) VALUES ('20131026180259');

INSERT INTO schema_migrations (version) VALUES ('20131026182124');

INSERT INTO schema_migrations (version) VALUES ('20131026182153');

INSERT INTO schema_migrations (version) VALUES ('20131028084946');

INSERT INTO schema_migrations (version) VALUES ('20131028222439');

INSERT INTO schema_migrations (version) VALUES ('20131028222918');

INSERT INTO schema_migrations (version) VALUES ('20131028222944');

INSERT INTO schema_migrations (version) VALUES ('20131028224531');

INSERT INTO schema_migrations (version) VALUES ('20131029094054');

INSERT INTO schema_migrations (version) VALUES ('20131102202638');

INSERT INTO schema_migrations (version) VALUES ('20131102204720');

INSERT INTO schema_migrations (version) VALUES ('20131102205104');

INSERT INTO schema_migrations (version) VALUES ('20131103071122');

INSERT INTO schema_migrations (version) VALUES ('20131110013757');

INSERT INTO schema_migrations (version) VALUES ('20131110023859');

INSERT INTO schema_migrations (version) VALUES ('20131113052026');

INSERT INTO schema_migrations (version) VALUES ('20131113083644');

INSERT INTO schema_migrations (version) VALUES ('20131116215109');

INSERT INTO schema_migrations (version) VALUES ('20131116233151');

INSERT INTO schema_migrations (version) VALUES ('20131118085536');

INSERT INTO schema_migrations (version) VALUES ('20131121164447');

INSERT INTO schema_migrations (version) VALUES ('20131201233605');
