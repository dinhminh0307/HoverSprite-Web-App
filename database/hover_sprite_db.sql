PGDMP  &    7                |            hover_sprite    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16598    hover_sprite    DATABASE     �   CREATE DATABASE hover_sprite WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE hover_sprite;
                postgres    false                        2615    16599    farmer_detail    SCHEMA        CREATE SCHEMA farmer_detail;
    DROP SCHEMA farmer_detail;
                postgres    false            �            1259    16665    farmer    TABLE     '   CREATE TABLE farmer_detail.farmer (
);
 !   DROP TABLE farmer_detail.farmer;
       farmer_detail         heap    postgres    false    6            �            1259    16683    farms    TABLE     &   CREATE TABLE farmer_detail.farms (
);
     DROP TABLE farmer_detail.farms;
       farmer_detail         heap    postgres    false    6            �            1259    16680 	   feedbacks    TABLE     *   CREATE TABLE farmer_detail.feedbacks (
);
 $   DROP TABLE farmer_detail.feedbacks;
       farmer_detail         heap    postgres    false    6            �            1259    16677    orders    TABLE     '   CREATE TABLE farmer_detail.orders (
);
 !   DROP TABLE farmer_detail.orders;
       farmer_detail         heap    postgres    false    6            �            1259    16668    receptionist    TABLE     -   CREATE TABLE farmer_detail.receptionist (
);
 '   DROP TABLE farmer_detail.receptionist;
       farmer_detail         heap    postgres    false    6            �            1259    16671    spray_services    TABLE     /   CREATE TABLE farmer_detail.spray_services (
);
 )   DROP TABLE farmer_detail.spray_services;
       farmer_detail         heap    postgres    false    6            �            1259    16674    sprayers    TABLE     )   CREATE TABLE farmer_detail.sprayers (
);
 #   DROP TABLE farmer_detail.sprayers;
       farmer_detail         heap    postgres    false    6            �            1259    16621    spray_services_seq    SEQUENCE     |   CREATE SEQUENCE public.spray_services_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.spray_services_seq;
       public          postgres    false            �          0    16665    farmer 
   TABLE DATA           '   COPY farmer_detail.farmer  FROM stdin;
    farmer_detail          postgres    false    217   g       �          0    16683    farms 
   TABLE DATA           &   COPY farmer_detail.farms  FROM stdin;
    farmer_detail          postgres    false    223   �       �          0    16680 	   feedbacks 
   TABLE DATA           *   COPY farmer_detail.feedbacks  FROM stdin;
    farmer_detail          postgres    false    222   �       �          0    16677    orders 
   TABLE DATA           '   COPY farmer_detail.orders  FROM stdin;
    farmer_detail          postgres    false    221   �       �          0    16668    receptionist 
   TABLE DATA           -   COPY farmer_detail.receptionist  FROM stdin;
    farmer_detail          postgres    false    218   �       �          0    16671    spray_services 
   TABLE DATA           /   COPY farmer_detail.spray_services  FROM stdin;
    farmer_detail          postgres    false    219   �       �          0    16674    sprayers 
   TABLE DATA           )   COPY farmer_detail.sprayers  FROM stdin;
    farmer_detail          postgres    false    220                     0    0    spray_services_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.spray_services_seq', 1, false);
          public          postgres    false    216            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     