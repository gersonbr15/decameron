PGDMP  .                    |            ITBF    16rc1    16rc1 f    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16695    ITBF    DATABASE     h   CREATE DATABASE "ITBF" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "ITBF";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16826    accommodation_restrictions    TABLE       CREATE TABLE public.accommodation_restrictions (
    room_type_id bigint NOT NULL,
    accommodation_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
 .   DROP TABLE public.accommodation_restrictions;
       public         heap    postgres    false    4            �            1259    16796    accommodations    TABLE     �   CREATE TABLE public.accommodations (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
 "   DROP TABLE public.accommodations;
       public         heap    postgres    false    4            �           0    0 !   COLUMN accommodations.description    COMMENT        COMMENT ON COLUMN public.accommodations.description IS 'Description of the accommodation (Single, Double, Triple, Quadruple)';
          public          postgres    false    233            �            1259    16795    accommodations_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.accommodations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accommodations_id_seq;
       public          postgres    false    233    4            �           0    0    accommodations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accommodations_id_seq OWNED BY public.accommodations.id;
          public          postgres    false    232            �            1259    16730    cache    TABLE     �   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap    postgres    false    4            �            1259    16737    cache_locks    TABLE     �   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap    postgres    false    4            �            1259    16762    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false    4            �            1259    16761    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    227    4            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    226            �            1259    16774    hotels    TABLE     �  CREATE TABLE public.hotels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    tax_id character varying(255) NOT NULL,
    number_of_rooms integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.hotels;
       public         heap    postgres    false    4            �           0    0    COLUMN hotels.name    COMMENT     =   COMMENT ON COLUMN public.hotels.name IS 'Name of the hotel';
          public          postgres    false    229            �           0    0    COLUMN hotels.address    COMMENT     C   COMMENT ON COLUMN public.hotels.address IS 'Address of the hotel';
          public          postgres    false    229            �           0    0    COLUMN hotels.city    COMMENT     K   COMMENT ON COLUMN public.hotels.city IS 'City where the hotel is located';
          public          postgres    false    229            �           0    0    COLUMN hotels.tax_id    COMMENT     T   COMMENT ON COLUMN public.hotels.tax_id IS 'Tax identification number of the hotel';
          public          postgres    false    229            �           0    0    COLUMN hotels.number_of_rooms    COMMENT     [   COMMENT ON COLUMN public.hotels.number_of_rooms IS 'Maximum number of rooms in the hotel';
          public          postgres    false    229            �            1259    16773    hotels_id_seq    SEQUENCE     v   CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.hotels_id_seq;
       public          postgres    false    229    4            �           0    0    hotels_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;
          public          postgres    false    228            �            1259    16754    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap    postgres    false    4            �            1259    16745    jobs    TABLE     �   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    postgres    false    4            �            1259    16744    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    224    4            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    223            �            1259    16697 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false    4            �            1259    16696    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    4    216            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    215            �            1259    16714    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false    4            �            1259    16787 
   room_types    TABLE     �   CREATE TABLE public.room_types (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.room_types;
       public         heap    postgres    false    4            �           0    0    COLUMN room_types.description    COMMENT     m   COMMENT ON COLUMN public.room_types.description IS 'Description of the room type (Standard, Junior, Suite)';
          public          postgres    false    231            �            1259    16786    room_types_id_seq    SEQUENCE     z   CREATE SEQUENCE public.room_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.room_types_id_seq;
       public          postgres    false    231    4            �           0    0    room_types_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.room_types_id_seq OWNED BY public.room_types.id;
          public          postgres    false    230            �            1259    16805    rooms    TABLE     H  CREATE TABLE public.rooms (
    id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    room_type_id bigint NOT NULL,
    accommodation_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.rooms;
       public         heap    postgres    false    4            �           0    0    COLUMN rooms.quantity    COMMENT     ]   COMMENT ON COLUMN public.rooms.quantity IS 'Number of rooms of this type and accommodation';
          public          postgres    false    235            �            1259    16804    rooms_id_seq    SEQUENCE     u   CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.rooms_id_seq;
       public          postgres    false    4    235            �           0    0    rooms_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;
          public          postgres    false    234            �            1259    16721    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false    4            �            1259    16704    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    16703    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218    4            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    217            �           2604    16799    accommodations id    DEFAULT     v   ALTER TABLE ONLY public.accommodations ALTER COLUMN id SET DEFAULT nextval('public.accommodations_id_seq'::regclass);
 @   ALTER TABLE public.accommodations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    16765    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    16777 	   hotels id    DEFAULT     f   ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);
 8   ALTER TABLE public.hotels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16748    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16700    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16790    room_types id    DEFAULT     n   ALTER TABLE ONLY public.room_types ALTER COLUMN id SET DEFAULT nextval('public.room_types_id_seq'::regclass);
 <   ALTER TABLE public.room_types ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    16808    rooms id    DEFAULT     d   ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);
 7   ALTER TABLE public.rooms ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    16707    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16826    accommodation_restrictions 
   TABLE DATA           x   COPY public.accommodation_restrictions (room_type_id, accommodation_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    236   �w       �          0    16796    accommodations 
   TABLE DATA           ]   COPY public.accommodations (id, description, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    233   �w       |          0    16730    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          postgres    false    221   x       }          0    16737    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          postgres    false    222   9x       �          0    16762    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    227   Vx       �          0    16774    hotels 
   TABLE DATA           v   COPY public.hotels (id, name, address, city, tax_id, number_of_rooms, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    229   sx       �          0    16754    job_batches 
   TABLE DATA           �   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    225   �y                 0    16745    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    224   �y       w          0    16697 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    216   z       z          0    16714    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    219   �z       �          0    16787 
   room_types 
   TABLE DATA           Y   COPY public.room_types (id, description, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    231   �z       �          0    16805    rooms 
   TABLE DATA           {   COPY public.rooms (id, hotel_id, room_type_id, accommodation_id, quantity, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    235   .{       {          0    16721    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    220   �{       y          0    16704    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          postgres    false    218   �{       �           0    0    accommodations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.accommodations_id_seq', 4, true);
          public          postgres    false    232            �           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    226            �           0    0    hotels_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hotels_id_seq', 8, true);
          public          postgres    false    228            �           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    223            �           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 9, true);
          public          postgres    false    215            �           0    0    room_types_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.room_types_id_seq', 3, true);
          public          postgres    false    230            �           0    0    rooms_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.rooms_id_seq', 14, true);
          public          postgres    false    234            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    217            �           2606    16840 :   accommodation_restrictions accommodation_restrictions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_restrictions
    ADD CONSTRAINT accommodation_restrictions_pkey PRIMARY KEY (room_type_id, accommodation_id);
 d   ALTER TABLE ONLY public.accommodation_restrictions DROP CONSTRAINT accommodation_restrictions_pkey;
       public            postgres    false    236    236            �           2606    16803 0   accommodations accommodations_description_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_description_unique UNIQUE (description);
 Z   ALTER TABLE ONLY public.accommodations DROP CONSTRAINT accommodations_description_unique;
       public            postgres    false    233            �           2606    16801 "   accommodations accommodations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accommodations DROP CONSTRAINT accommodations_pkey;
       public            postgres    false    233            �           2606    16743    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    222            �           2606    16736    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    221            �           2606    16770    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    227            �           2606    16772 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    227            �           2606    16783    hotels hotels_name_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_name_unique UNIQUE (name);
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_name_unique;
       public            postgres    false    229            �           2606    16781    hotels hotels_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    229            �           2606    16785    hotels hotels_tax_id_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_tax_id_unique UNIQUE (tax_id);
 E   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_tax_id_unique;
       public            postgres    false    229            �           2606    16760    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    225            �           2606    16752    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    224            �           2606    16702    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            �           2606    16720 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    219            �           2606    16794 (   room_types room_types_description_unique 
   CONSTRAINT     j   ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_description_unique UNIQUE (description);
 R   ALTER TABLE ONLY public.room_types DROP CONSTRAINT room_types_description_unique;
       public            postgres    false    231            �           2606    16792    room_types room_types_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.room_types DROP CONSTRAINT room_types_pkey;
       public            postgres    false    231            �           2606    16810    rooms rooms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            postgres    false    235            �           2606    16727    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    220            �           2606    16713    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    218            �           2606    16711    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           1259    16753    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    224            �           1259    16729    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    220            �           1259    16728    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    220            �           2606    16834 N   accommodation_restrictions accommodation_restrictions_accommodation_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_restrictions
    ADD CONSTRAINT accommodation_restrictions_accommodation_id_foreign FOREIGN KEY (accommodation_id) REFERENCES public.accommodations(id) ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.accommodation_restrictions DROP CONSTRAINT accommodation_restrictions_accommodation_id_foreign;
       public          postgres    false    233    236    3549            �           2606    16829 J   accommodation_restrictions accommodation_restrictions_room_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_restrictions
    ADD CONSTRAINT accommodation_restrictions_room_type_id_foreign FOREIGN KEY (room_type_id) REFERENCES public.room_types(id) ON DELETE CASCADE;
 t   ALTER TABLE ONLY public.accommodation_restrictions DROP CONSTRAINT accommodation_restrictions_room_type_id_foreign;
       public          postgres    false    3545    236    231            �           2606    16821 $   rooms rooms_accommodation_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_accommodation_id_foreign FOREIGN KEY (accommodation_id) REFERENCES public.accommodations(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_accommodation_id_foreign;
       public          postgres    false    233    3549    235            �           2606    16811    rooms rooms_hotel_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hotels(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_hotel_id_foreign;
       public          postgres    false    229    235    3539            �           2606    16816     rooms rooms_room_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_type_id_foreign FOREIGN KEY (room_type_id) REFERENCES public.room_types(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_room_type_id_foreign;
       public          postgres    false    3545    231    235            �      x������ � �      �   L   x�3�N�K���I�4202�50�54R04�2��26�*��e�钟��J�cΐ�����p�&����-F��� ��-�      |      x������ � �      }      x������ � �      �      x������ � �      �   R  x�m��N�0E�ӯ�uP�<�]�T��X�1� #�q�G���Ⱦך{f\���w���a�}���]}��(r,�D��kd"/ʪn�5D*�$��L`V�Y�f�E�y�*�10�ǃ5'�h�81l�%<^�hIr�	=郱�J�l��t4Z���D�f����n��MˋZD�`G���,{��!)���Z���ˠy}�=/�)�Dd9!������Y}�c����&�6O/j���Ύ��i��b.9�#���\�|��-O�u��X��c��fb�G�x
���2��;y[�|j���^�8%�
���.Q�S7��x����$��6ez>ܗ[?_�V��O��      �      x������ � �            x������ � �      w   �   x�m���0�g�1f-�ȿ�4ek�����q0\��so���;�G.
'��,q���((<@X�c����+��.�
5�Xظ>$����|ca��zH��R�f��\���9�M����?�Kkl�VS�9���״�tm,{OK����I)�:�w�      z      x������ � �      �   C   x�3�t-.I�KI,�4202�50�54R04�2��26�*��e��U���O�c���̒TR���qqq >z!�      �   T   x��˱�0D�ڞ��|�D���J骯{0��О���p=ڼ�K�dXe���ˑ��/����e5Kl�z�.1E      {      x������ � �      y      x������ � �     