PGDMP                      |            hover_sprite    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16598    hover_sprite    DATABASE     �   CREATE DATABASE hover_sprite WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE hover_sprite;
                postgres    false                        2615    16599    farmer_detail    SCHEMA        CREATE SCHEMA farmer_detail;
    DROP SCHEMA farmer_detail;
                postgres    false            �            1259    16600    farmer    TABLE       CREATE TABLE farmer_detail.farmer (
    id character varying(255) NOT NULL,
    email character varying(255),
    full_name character varying(255),
    home_address character varying(255),
    password character varying(255),
    phone_number character varying(255)
);
 !   DROP TABLE farmer_detail.farmer;
       farmer_detail         heap    postgres    false    6            �            1259    16605    farms    TABLE     &  CREATE TABLE farmer_detail.farms (
    farmid character varying(255) NOT NULL,
    crop_type character varying(255),
    farm_area double precision NOT NULL,
    farm_location character varying(255),
    farmer_id character varying(255),
    CONSTRAINT farms_crop_type_check CHECK (((crop_type)::text = ANY (ARRAY[('CEREALS'::character varying)::text, ('FRUITS'::character varying)::text, ('VEGETABLES'::character varying)::text, ('OILSEEDS'::character varying)::text, ('LEGUMES'::character varying)::text, ('TUBERS'::character varying)::text])))
);
     DROP TABLE farmer_detail.farms;
       farmer_detail         heap    postgres    false    6            �            1259    16611    receptionist    TABLE       CREATE TABLE farmer_detail.receptionist (
    id character varying(255) NOT NULL,
    email character varying(255),
    full_name character varying(255),
    home_address character varying(255),
    password character varying(255),
    phone_number character varying(255)
);
 '   DROP TABLE farmer_detail.receptionist;
       farmer_detail         heap    postgres    false    6            �            1259    16616    spray_services    TABLE     �   CREATE TABLE farmer_detail.spray_services (
    id integer NOT NULL,
    name_of_service character varying(255),
    price double precision NOT NULL,
    service_type character varying(255)
);
 )   DROP TABLE farmer_detail.spray_services;
       farmer_detail         heap    postgres    false    6            �            1259    16621    spray_services_seq    SEQUENCE     |   CREATE SEQUENCE public.spray_services_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.spray_services_seq;
       public          postgres    false            �          0    16600    farmer 
   TABLE DATA           c   COPY farmer_detail.farmer (id, email, full_name, home_address, password, phone_number) FROM stdin;
    farmer_detail          postgres    false    216   �       �          0    16605    farms 
   TABLE DATA           ^   COPY farmer_detail.farms (farmid, crop_type, farm_area, farm_location, farmer_id) FROM stdin;
    farmer_detail          postgres    false    217   y       �          0    16611    receptionist 
   TABLE DATA           i   COPY farmer_detail.receptionist (id, email, full_name, home_address, password, phone_number) FROM stdin;
    farmer_detail          postgres    false    218   �       �          0    16616    spray_services 
   TABLE DATA           Y   COPY farmer_detail.spray_services (id, name_of_service, price, service_type) FROM stdin;
    farmer_detail          postgres    false    219   �                  0    0    spray_services_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.spray_services_seq', 1, false);
          public          postgres    false    220            _           2606    16623    farmer farmer_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY farmer_detail.farmer
    ADD CONSTRAINT farmer_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY farmer_detail.farmer DROP CONSTRAINT farmer_pkey;
       farmer_detail            postgres    false    216            a           2606    16625    farms farms_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY farmer_detail.farms
    ADD CONSTRAINT farms_pkey PRIMARY KEY (farmid);
 A   ALTER TABLE ONLY farmer_detail.farms DROP CONSTRAINT farms_pkey;
       farmer_detail            postgres    false    217            c           2606    16627    receptionist receptionist_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY farmer_detail.receptionist
    ADD CONSTRAINT receptionist_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY farmer_detail.receptionist DROP CONSTRAINT receptionist_pkey;
       farmer_detail            postgres    false    218            e           2606    16629 "   spray_services spray_services_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY farmer_detail.spray_services
    ADD CONSTRAINT spray_services_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY farmer_detail.spray_services DROP CONSTRAINT spray_services_pkey;
       farmer_detail            postgres    false    219            f           2606    16630 !   farms fkcvh21m6ff1tgx1xuoodbghqnr    FK CONSTRAINT     �   ALTER TABLE ONLY farmer_detail.farms
    ADD CONSTRAINT fkcvh21m6ff1tgx1xuoodbghqnr FOREIGN KEY (farmer_id) REFERENCES farmer_detail.farmer(id);
 R   ALTER TABLE ONLY farmer_detail.farms DROP CONSTRAINT fkcvh21m6ff1tgx1xuoodbghqnr;
       farmer_detail          postgres    false    4703    217    216            �   �   x�u�;�0����Z
��/ ��7���r)�j��*���Y޳<.!RyͤP�8� *�j�8�]���ʿ�O�� z���L�FI������Y�zb�V��;�~Y��zچ��h.!&�5�
����b�e��ۉ$����0��Nӝ���h��"��lsa���#�4��oF      �   B   x�ss400�t
�	�420��HT����t
s�%�`��@���Lw�<��X���!W� �t�      �      x������ � �      �      x������ � �     