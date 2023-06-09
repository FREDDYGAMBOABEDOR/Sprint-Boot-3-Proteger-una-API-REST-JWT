PGDMP                         {            vollmed_api    14.2    14.2 !               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    65537    vollmed_api    DATABASE     i   CREATE DATABASE vollmed_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE vollmed_api;
                postgres    false            �            1259    65538    flyway_schema_history    TABLE     �  CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);
 )   DROP TABLE public.flyway_schema_history;
       public         heap    postgres    false            �            1259    73729    medicos    TABLE     !  CREATE TABLE public.medicos (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    documento character varying(6) NOT NULL,
    especialidad character varying(100) NOT NULL,
    calle character varying(100) NOT NULL,
    distrito character varying(100) NOT NULL,
    complemento character varying(100),
    numero character varying(120),
    cuidad character varying(100) NOT NULL,
    telefono character varying(20) DEFAULT '8888'::character varying NOT NULL,
    activo boolean
);
    DROP TABLE public.medicos;
       public         heap    postgres    false            �            1259    73728    medicos_id_seq    SEQUENCE     w   CREATE SEQUENCE public.medicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.medicos_id_seq;
       public          postgres    false    211                       0    0    medicos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.medicos_id_seq OWNED BY public.medicos.id;
          public          postgres    false    210            �            1259    81921 	   pacientes    TABLE     +  CREATE TABLE public.pacientes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    documentoidentidad character varying(14) NOT NULL,
    telefono character varying(20) NOT NULL,
    urbanizacion character varying(100) NOT NULL,
    distrito character varying(100) NOT NULL,
    codigopostal character varying(9) NOT NULL,
    complemento character varying(100),
    numero character varying(20),
    provincia character varying(100) NOT NULL,
    ciudad character varying(100) NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    81920    pacientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pacientes_id_seq;
       public          postgres    false    213                       0    0    pacientes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;
          public          postgres    false    212            �            1259    90120    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    login character varying(100) NOT NULL,
    clave character varying(300) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    90119    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    215                       0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    214            k           2604    73732 
   medicos id    DEFAULT     h   ALTER TABLE ONLY public.medicos ALTER COLUMN id SET DEFAULT nextval('public.medicos_id_seq'::regclass);
 9   ALTER TABLE public.medicos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            m           2604    81924    pacientes id    DEFAULT     l   ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);
 ;   ALTER TABLE public.pacientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            n           2604    90123    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    65538    flyway_schema_history 
   TABLE DATA           �   COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
    public          postgres    false    209   �(                 0    73729    medicos 
   TABLE DATA           �   COPY public.medicos (id, nombre, email, documento, especialidad, calle, distrito, complemento, numero, cuidad, telefono, activo) FROM stdin;
    public          postgres    false    211   �)                 0    81921 	   pacientes 
   TABLE DATA           �   COPY public.pacientes (id, nombre, email, documentoidentidad, telefono, urbanizacion, distrito, codigopostal, complemento, numero, provincia, ciudad) FROM stdin;
    public          postgres    false    213   �*                 0    90120    usuarios 
   TABLE DATA           4   COPY public.usuarios (id, login, clave) FROM stdin;
    public          postgres    false    215   �*                  0    0    medicos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.medicos_id_seq', 12, true);
          public          postgres    false    210                       0    0    pacientes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pacientes_id_seq', 1, false);
          public          postgres    false    212                       0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);
          public          postgres    false    214            p           2606    65545 .   flyway_schema_history flyway_schema_history_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);
 X   ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
       public            postgres    false    209            s           2606    73740    medicos medicos_documento_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_documento_key UNIQUE (documento);
 G   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_documento_key;
       public            postgres    false    211            u           2606    73738    medicos medicos_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_email_key;
       public            postgres    false    211            w           2606    73736    medicos medicos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public            postgres    false    211            y           2606    81932 *   pacientes pacientes_documentoidentidad_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_documentoidentidad_key UNIQUE (documentoidentidad);
 T   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_documentoidentidad_key;
       public            postgres    false    213            {           2606    81930    pacientes pacientes_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_email_key;
       public            postgres    false    213            }           2606    81928    pacientes pacientes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    213                       2606    90125    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215            q           1259    65546    flyway_schema_history_s_idx    INDEX     `   CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);
 /   DROP INDEX public.flyway_schema_history_s_idx;
       public            postgres    false    209                 x����N�0@��W�R9��8�.�R��*u�h3���m��N�m���h��M9��Jz���]ߍ3�<?��nۭa3��X�&� ǹ|NyB2
�"SFc#J�JE@����ۃ*�v��!��񌦶�o�a���m�VGD�փ�EÀ��>��χ��ls�}��@v,�agk"�h�!��A���au�J�}i����U@�^��p5���+У���Xp�����������:]q�L^�[���Zcd�4��]j���oMUU?���@         �   x���M�0F��Spb+(�$��Qb\���"�J��[y/f��ԅ|�I�|o�� ���O�?����(r7Q(�=X,W�xMBH0Ϲ�u<H�6�0ʡ��3!ؒ���"Uo�Y�7�����ng0�Z�*o��E=7�m(����Â��0$xE��(Θ�ǭ�V��2�;c����x�j|ZT�=!6_8Z[��v	!7��/            x������ � �         \   x�3�L+J�����SHO�M�O�T1JT14RI+ы�I�ʨ�L��r�v�2��6ҋ4+t�t6t�pq
��M.��H�2-pJI������ l��     