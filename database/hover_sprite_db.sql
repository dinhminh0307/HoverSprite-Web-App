PGDMP                      |            hover_sprite    16.3    16.3 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16506    hover_sprite    DATABASE     �   CREATE DATABASE hover_sprite WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE hover_sprite;
                postgres    false                        2615    16507    farmer_detail    SCHEMA        CREATE SCHEMA farmer_detail;
    DROP SCHEMA farmer_detail;
                developer_user    false            �            1259    16508    farmer    TABLE     2  CREATE TABLE farmer_detail.farmer (
    id character varying(255) NOT NULL,
    email character varying(255),
    full_name character varying(255),
    home_address character varying(255),
    password character varying(255),
    phone_number character varying(255),
    username character varying(255)
);
 !   DROP TABLE farmer_detail.farmer;
       farmer_detail         heap    developer_user    false    6            �            1259    16513    receptionist    TABLE     8  CREATE TABLE farmer_detail.receptionist (
    id character varying(255) NOT NULL,
    email character varying(255),
    full_name character varying(255),
    home_address character varying(255),
    password character varying(255),
    phone_number character varying(255),
    username character varying(255)
);
 '   DROP TABLE farmer_detail.receptionist;
       farmer_detail         heap    developer_user    false    6            �          0    16508    farmer 
   TABLE DATA           m   COPY farmer_detail.farmer (id, email, full_name, home_address, password, phone_number, username) FROM stdin;
    farmer_detail          developer_user    false    216   
       �          0    16513    receptionist 
   TABLE DATA           s   COPY farmer_detail.receptionist (id, email, full_name, home_address, password, phone_number, username) FROM stdin;
    farmer_detail          developer_user    false    217   �       �   �  x���ɒ�J���S���fv-2(�ȠFoRA@e&x�kh�"�nD'����<�#a>9�*+� �-H�k��t��q6�p2\�J�-Sd��~�����,b�2��"m#���3�!��'5ח(w?����Rb����u�E33���@_$#�)��7G�h0]�s�Ԇ�o�Ir�#�d]27f��ʖ1]�n��ȧ����ꑂ�d�_�`�O	`7U��qh��}Řs�-���T;��1p��WRC���֢�	����$�G.5	��8¢���Q
������2ouGy{2$1=���pU{I����o�1�-J��LT�_��Ǉ���l��m��ϻl�mct��!K]�d	RR�5��#Ԑj��~Ӡ�W��������h�Եn3���0�"���$��
 �_*���t	�3K� ׽J�ҳo�5(�2/�%�����&�����g�$�5�8�D�.:cwh�6�=��#�~#�o״�D�ƻpyϚ&9Ӱ��V�]��%��nc�� �g:��4��t�9�w7jAUw}>�mo]�(�����t��.�Is�&ӭ�]~H��7�U�!��8�p��}���!���p�`~�vh#�DɃ�+4tݤ�k$�zeǥ��i��s�	���j��T����m����D>d��q�4�ґ�W��`��3����i�7H����K��\�������,�آv����PR��\[_��Z�#����z���9|)?��̜�;=���u��;�.X����Z��n�n����ۣ����%0�̤&�'�8����v�%k���#��^�sc3q�Y(��
��J҅P�E�QGܫ��_�� {b
�,�>�!���D#c��.+�w�:�b��M� �LI����d¨��\�츋��I�\��aу�� ��W`XL� |h�Y4=�7b!�Ui�WQ~�A,du����b%�m�Jsrw��e��
�H|���[�����eX�'�m>���;���d����y�}��(;�8�g�K���X��B^;Q��v�y��̑�_F��0?�X�s����N�SO;�œIc�XFQ�B��l��N�*�Yݧ��=����1�mR�#��P����7q�S#�]�M=�M�a���2�.��q�t�4ݟ��Q��:8�H[A���+�m���Iͤ�>E]�J�;��l��Qп�B^^^~����      �   t   x�200�,JMN-(qH�M���K��������,NLqH,N!���Q������gR�e�GAJr�WPpH�ETRv~ix��S�qY�e���o�kNq����W�O�Y��ov%g���=... �%�     