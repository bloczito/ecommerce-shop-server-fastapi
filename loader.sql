-- create table if not exists brands
-- (
--     brand_id integer
--     constraint pk_brands_id
--     primary key autoincrement ,
--     name     varchar(255) not null
--     );
--
-- create table if not exists users
-- (
--     user_id      integer
--     constraint pk_users_id
--     primary key autoincrement ,
--     username     varchar(255) not null,
--     password     varchar(255),
--     external_id  varchar(255),
--     name         varchar(255),
--     account_type accounttype  not null,
--     city         varchar(255),
--     street       varchar(255),
--     postcode     varchar(255)
--     );
--
-- create table if not exists products
-- (
--     product_id  integer
--     constraint pk_products_id
--     primary key autoincrement,
--     name        varchar(255)  not null,
--     description text                  ,
--     price       numeric(6, 2) not null,
--     brand_id    integer       not null
--     constraint fk_products_brand_id__brand_id
--     references brands
--     on update restrict on delete restrict,
--     category    category      not null,
--     subcategory subcategory   not null,
--     url         varchar(255)  not null
--     );
--
-- create table if not exists orders
-- (
--     order_id integer
--     constraint pk_orders_id
--     primary key autoincrement,
--     user_id       integer      not null
--     constraint fk_orders_user_id__user_id
--     references users
--     on update restrict on delete restrict,
--     customer_name varchar(255) not null,
--     email         varchar(255) not null,
--     city          varchar(255) not null,
--     street        varchar(255) not null,
--     postcode      varchar(255) not null,
--     order_number  varchar(255) not null,
--     order_date    timestamp    not null
--     );
--
-- create table if not exists orderelements
-- (
--     order_element_id integer
--     constraint pk_orderelements_id
--     primary key autoincrement,
--     quantity         integer not null,
--     order_id         integer not null
--     constraint fk_orderelements_order_id__order_id
--     references orders
--     on update restrict on delete restrict,
--     product_id       integer not null
--     constraint fk_orderelements_product_id__product_id
--     references products
--     on update restrict on delete restrict
-- );
--


INSERT INTO brands (id, name) VALUES (1, 'Brand A');
INSERT INTO brands (id, name) VALUES (2, 'Brand B');
INSERT INTO brands (id, name) VALUES (3, 'Brand C');


INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (1, 'Czarna bluza', 'Lorem ipsum', 150.00, 'https://img01.ztat.net/article/spp-media-p1/e01973b554c9426ab5c62972e85e47de/8287e46a418242fe87f169d5ce9237fe.jpg?imwidth=762', 1, 'SWEATSHIRTS', 'CRAWNECK');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (2, 'Czarna bluza z kapturem', 'Lorem ipsum', 199.00, 'https://img01.ztat.net/article/spp-media-p1/9669d5f604c44a84b42a5b7bad855857/990a374a8ac94fc8b034c60c8afb1bea.jpg?imwidth=762&filter=packshot', 2, 'SWEATSHIRTS', 'HOODIE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (3, 'Żółta bluza', 'Lorem ipsum', 189.00, 'https://img01.ztat.net/article/spp-media-p1/0fc857c1cb884a8baf36e57ed07c19be/285edb2ce6e74e34876454b3b90d2c0f.jpg?imwidth=1800', 3, 'SWEATSHIRTS', 'CRAWNECK');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (4, 'Żółta bluza z kapturem', 'Lorem ipsum', 210.00, 'https://img01.ztat.net/article/spp-media-p1/6df55829bbd648fd9743b36c68e322e9/59c801c31f784d6f93ce93d04346ce64.jpg?imwidth=762&filter=packshot', 2, 'SWEATSHIRTS', 'HOODIE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (5, 'Biała bluza', 'Lorem ipsum', 150.00, 'https://img01.ztat.net/article/spp-media-p1/ea07a9cab3fc4c4f820ed417e7d6db43/8389c9790c3646d5abc106da05ad099d.jpg?imwidth=762&filter=packshot', 3, 'SWEATSHIRTS', 'CRAWNECK');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (6, 'Biała bluza z kapturem', 'Lorem ipsum', 190.00, 'https://img01.ztat.net/article/spp-media-p1/015f992a60174500ae0c8fbcd46b5028/674f4dd6d08846348d9576037fac7add.jpg?imwidth=762&filter=packshot', 2, 'SWEATSHIRTS', 'HOODIE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (7, 'Szara bluza', 'Lorem ipsum', 160.00, 'https://img01.ztat.net/article/spp-media-p1/f85bb9a1e990322ea8b25920f158ad80/4bc71fff25a343fbb3a5a2fcc2096797.jpg?imwidth=1800', 1, 'SWEATSHIRTS', 'CRAWNECK');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (8, 'Szara bluza z kapturem', 'Lorem ipsum', 175.00, 'https://img01.ztat.net/article/spp-media-p1/9964028c889649fc9458aebd296eae85/eda9ee489e964fce96c1249319c53aea.jpg?imwidth=1800', 2, 'SWEATSHIRTS', 'HOODIE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (9, 'Zielona bluza', 'Lorem ipsum', 180.00, 'https://img01.ztat.net/article/spp-media-p1/5487951813e94302b67cd8f9656cc53d/7ea9c2dfeb2d4ddb9e7a67dffa4aeecc.jpg?imwidth=1800', 3, 'SWEATSHIRTS', 'CRAWNECK');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (10, 'Zielona bluza z kapturem', 'Lorem ipsum', 199.00, 'https://img01.ztat.net/article/spp-media-p1/87b43ae8984147e8a619aacfae1db417/9a80827ac306491a9a9a9342704a05a5.jpg?imwidth=762&filter=packshot', 1, 'SWEATSHIRTS', 'HOODIE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (11, 'Biały tees', null, 140.00, 'https://img01.ztat.net/article/spp-media-p1/fb21f203fc5349d896258a63d108b895/33342daee92142ceb8b7dfd435c24dfd.jpg?imwidth=762', 2, 'T_SHIRTS', 'T_SHIRT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (12, 'Biały longsleeve', null, 149.00, 'https://img01.ztat.net/article/spp-media-p1/72534a537c724d5694a6702b7d59563c/67be85ba0d67411a846a661828ba238a.jpg?imwidth=762', 1, 'T_SHIRTS', 'LONG_SLEEVE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (13, 'Białe polo', null, 155.00, 'https://img01.ztat.net/article/spp-media-p1/2dc4e2a339dc3b36b17ba0d97330118c/5f1416c8d93c465eacddf5a6458bbb0e.jpg?imwidth=1800&filter=packshot', 3, 'T_SHIRTS', 'POLO');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (14, 'Czarny tees', null, 110.00, 'https://img01.ztat.net/article/spp-media-p1/75d5f8238bb04a2c98bee762c0a29508/c0d14ae44a44492b911c360e03608a0c.jpg?imwidth=762', 2, 'T_SHIRTS', 'T_SHIRT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (15, 'Czarny longsleeve', null, 119.00, 'https://img01.ztat.net/article/spp-media-p1/5ed3497bff8d4a7982d59aa95878d277/89224417411e4483a08599b4d0c5744e.jpg?imwidth=1800', 1, 'T_SHIRTS', 'LONG_SLEEVE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (16, 'Czarne polo', null, 130.00, 'https://img01.ztat.net/article/spp-media-p1/cc5ea70982864ec5b4d1fb0545a96f3c/e0261cec79ca4184a819b9e5f6994e66.jpg?imwidth=762', 3, 'T_SHIRTS', 'POLO');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (17, 'Szary tees', null, 75.00, 'https://img01.ztat.net/article/spp-media-p1/8c85f79e0bfe4c01bf6ff4d633d211cd/9f9caeba1fa14050a296e8280b25dba1.jpg?imwidth=1800&imformat=jpeg', 2, 'T_SHIRTS', 'T_SHIRT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (18, 'Szary longsleeve', null, 99.00, 'https://img01.ztat.net/article/spp-media-p1/4aab0bee51383cf4814855cac605dcfb/c1f4b92117bf4cc2acaf2840117b0692.jpg?imwidth=1800&imformat=jpeg', 1, 'T_SHIRTS', 'LONG_SLEEVE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (19, 'Szare polo', null, 89.00, 'https://img01.ztat.net/article/spp-media-p1/680aa80afd714145954ad2bf8e88e726/15fb57735ae741a6aa2ef56af2f92275.jpg?imwidth=762&imformat=jpeg', 3, 'T_SHIRTS', 'POLO');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (20, 'Różowy tees', null, 180.00, 'https://img01.ztat.net/article/spp-media-p1/272893f8c4f8429b891d799841d7d221/c4d46afccc4c432ea115c92256cf798a.jpg?imwidth=762', 2, 'T_SHIRTS', 'T_SHIRT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (21, 'Różowy longsleeve', null, 199.00, 'https://img01.ztat.net/article/spp-media-p1/6151ac3cd2b348b18ba2caf783163271/3705fe816d2f46ebbe567f77e47e774a.jpg?imwidth=762&filter=packshot', 1, 'T_SHIRTS', 'LONG_SLEEVE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (22, 'Różowe polo', null, 180.00, 'https://img01.ztat.net/article/spp-media-p1/554f4abf466b4676b98a38a7bb96c49a/777eb711521849c7b03c58af6ca4d60e.jpg?imwidth=1800&filter=packshot', 3, 'T_SHIRTS', 'POLO');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (23, 'Niebieski tees', null, 180.00, 'https://img01.ztat.net/article/spp-media-p1/3ca21cefd3dd4bdba09a6bcb0a7ca983/c478ab1e394046deb5d09f3886034dca.jpg?imwidth=762', 2, 'T_SHIRTS', 'T_SHIRT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (24, 'Niebieski longsleeve', null, 199.00, 'https://img01.ztat.net/article/spp-media-p1/76fd465a9a8d435aa9811befd6e5b580/5ebbcda484d74638a930390cc8b416db.jpg?imwidth=762', 1, 'T_SHIRTS', 'LONG_SLEEVE');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (25, 'Niebieskie polo', null, 180.00, 'https://img01.ztat.net/article/spp-media-p1/4228c241798b4b9d8c938b57fe3826c4/e1b49c66483545438eeed1e96977159c.jpg?imwidth=762', 3, 'T_SHIRTS', 'POLO');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (26, 'Chinosy - indygo', null, 220.00, 'https://img01.ztat.net/article/spp-media-p1/0443064a024d4b06b020081a9c1377d9/4aa35c3abc66401e8915b8d16d63e2b3.jpg?imwidth=1800', 2, 'TROUSERS', 'CHINOS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (27, 'Chinosy - różowe', null, 199.00, 'https://img01.ztat.net/article/spp-media-p1/a03aa496865c4c90b4b1cc688b4edafa/6fe671a75a9e4c0993e6410bef6462d2.jpg?imwidth=1800', 1, 'TROUSERS', 'CHINOS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (28, 'Chinosy - zielone', null, 189.00, 'https://img01.ztat.net/article/spp-media-p1/03871cd8930630b1b49e54f4c77c9599/c13f2a47ea8845368e23a55e3cf38184.jpg?imwidth=762', 3, 'TROUSERS', 'CHINOS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (29, 'Chinosy - beżowe', null, 120.00, 'https://img01.ztat.net/article/spp-media-p1/2aff679467ad3739ae4ed2bede741a5f/67b2e5f216e047058b68cece71d5ce94.jpg?imwidth=762', 2, 'TROUSERS', 'CHINOS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (30, 'Jeansy - jasne dziury', null, 160.00, 'https://img01.ztat.net/article/spp-media-p1/8aa2154ed9af4e4e95ce032e237ccf92/910b2f4cb61c4f28bb8f1507295fad5b.jpg?imwidth=762', 1, 'TROUSERS', 'JEANS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (31, 'Jeansy - jasne', null, 280.00, 'https://img01.ztat.net/article/spp-media-p1/3d514eeaa5704e1da493e8b9767686f9/bb817f638a0646f5800ffe974c25d25a.jpg?imwidth=762', 2, 'TROUSERS', 'JEANS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (32, 'Jeansy - dziury', null, 320.00, 'https://img01.ztat.net/article/spp-media-p1/7a0158e9800b4e11a03068bc62fea45a/3e2fd188da23491fbfe28f4155789518.jpg?imwidth=1800', 3, 'TROUSERS', 'JEANS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (33, 'Jeansy - czarne', null, 189.00, 'https://img01.ztat.net/article/spp-media-p1/e6c6eee4f0fb4b64a8187c5def61293c/8df9f88edf6c4d1e825260e1965ac134.jpg?imwidth=1800', 1, 'TROUSERS', 'JEANS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (34, 'Eleganckie - beżowe', null, 223.00, 'https://img01.ztat.net/article/spp-media-p1/fda045f7aeac4c05908af717822b0bbd/d0d0e37b506840fdb9003b92daab0792.jpg?imwidth=1800', 2, 'TROUSERS', 'ELEGANT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (35, 'Eleganckie - szare', null, 190.00, 'https://img01.ztat.net/article/spp-media-p1/83473624bd783b1198b5eb717e733b29/6fa850e6060e432a83ebee9e98eea7db.jpg?imwidth=1800', 3, 'TROUSERS', 'ELEGANT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (36, 'Eleganckie - granatowe', null, 147.00, 'https://img01.ztat.net/article/spp-media-p1/c8a52c0f40583db497f24a5bcbea4174/9d943134c82a4c4cb205f26ed878e6f7.jpg?imwidth=1800', 1, 'TROUSERS', 'ELEGANT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (37, 'Eleganckie - białe', null, 230.00, 'https://img01.ztat.net/article/spp-media-p1/29fc8cd353d449d599e6dc636c489b59/8987fe44bf1645f081013e06a7b96b3d.jpg?imwidth=1800', 2, 'TROUSERS', 'ELEGANT');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (38, 'Kapelusz - czarny', null, 189.00, 'https://img01.ztat.net/article/spp-media-p1/2e2121f3dc324c63a8c6747fe12cae8e/fdcab5fd0939449f90f0a524a2c8dcc1.jpg?imwidth=1800&filter=packshot', 3, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (39, 'Kapelusz - biały', null, 100.00, 'https://img01.ztat.net/article/spp-media-p1/eba66d23ead244c69e3ffb88fee09514/1403ae5cd3b24f2680a5d3c934a7a4b6.jpg?imwidth=762&filter=packshot', 1, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (40, 'Kapelusz - niebieski', null, 89.00, 'https://img01.ztat.net/article/spp-media-p1/45b18d3e200844b68c97d03d3d6cfd26/d2d8d94c894d4f51b9f1bb4f3d58799d.jpg?imwidth=1800', 2, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (41, 'Kapelusz - krata', null, 149.00, 'https://img01.ztat.net/article/spp-media-p1/35d7dddeb6b848f7bfe88e9539a76509/1320b9a5d60047f1bafcb7e422377b7e.jpg?imwidth=762&filter=packshot', 3, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (42, 'Kapelusz - tie dye', null, 130.00, 'https://img01.ztat.net/article/spp-media-p1/d81d3ba092564fb08a1ad05d8c094860/44df85afaf924c8f8a43335139a94b54.jpg?imwidth=762&filter=packshot', 1, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (43, 'Czapka z daszkiem - biała', null, 189.00, 'https://img01.ztat.net/article/spp-media-p1/4314e238ee4738ce81002cf29327278c/58538dc33fef4aecbb0c6445b64d7cbf.jpg?imwidth=1800', 2, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (44, 'Czapka z daszkiem - różowa', null, 145.00, 'https://img01.ztat.net/article/spp-media-p1/48ccd780bcf24c25b21e6751b38ea245/6987063319c74816b2ba5c659617c4b2.jpg?imwidth=762&filter=packshot', 3, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (45, 'Czapka z daszkiem - czarna', null, 189.00, 'https://img01.ztat.net/article/spp-media-p1/f98c8068d6384f02b19e2179d88acc85/21ee9e9949ff48469e3ffa263f405a43.jpg?imwidth=762&filter=packshot', 1, 'ACCESSORIES', 'HATS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (46, 'Swatch POW WOW', null, 405.00, 'https://img01.ztat.net/article/spp-media-p1/f08054d16de04f30a13a5d285916a65d/1204d428b20048d384df3f93f053fe98.jpg?imwidth=1800&filter=packshot', 1, 'ACCESSORIES', 'WATCHES');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (47, 'Casio', null, 179.00, 'https://img01.ztat.net/article/spp-media-p1/5d1b48204ad63c95a0b4d8cd09990ac3/a67b1e2f1ca44c108403eb3ccbba37ce.jpg?imwidth=1800&filter=packshot', 1, 'ACCESSORIES', 'WATCHES');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (48, 'G-SHOCK', null, 579.00, 'https://img01.ztat.net/article/spp-media-p1/59df646143b640f7a4be1d1ba0073273/e203ad08971b465aab9260755dcfb0d8.jpg?imwidth=762&filter=packshot', 1, 'ACCESSORIES', 'WATCHES');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (49, 'Pasek skórzany czarny', null, 79.00, 'https://img01.ztat.net/article/spp-media-p1/59df646143b640f7a4be1d1ba0073273/e203ad08971b465aab9260755dcfb0d8.jpg?imwidth=762&filter=packshot', 1, 'ACCESSORIES', 'STRIPES');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (50, 'Pasek skórzany brązowy', null, 119.00, 'https://img01.ztat.net/article/spp-media-p1/59df646143b640f7a4be1d1ba0073273/e203ad08971b465aab9260755dcfb0d8.jpg?imwidth=762&filter=packshot', 2, 'ACCESSORIES', 'STRIPES');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (51, 'Pasek parciany', null, 59.00, 'https://img01.ztat.net/article/spp-media-p1/59df646143b640f7a4be1d1ba0073273/e203ad08971b465aab9260755dcfb0d8.jpg?imwidth=762&filter=packshot', 3, 'ACCESSORIES', 'STRIPES');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (52, 'Plecak skórzany - czarny', null, 99.00, 'https://img01.ztat.net/article/spp-media-p1/7790c41cbb72380d9217ad6a2f9b991a/ff98c8a9f8484d29923cfc3d9ff5d3b3.jpg?imwidth=762', 1, 'ACCESSORIES', 'BACKPACKS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (53, 'Plecak - czarny', null, 119.00, 'https://img01.ztat.net/article/spp-media-p1/0de02d0928c645c6820e54d2ffe2a828/a5002d835c5746e48cd2fb39be81e31f.jpg?imwidth=762&filter=packshot', 2, 'ACCESSORIES', 'BACKPACKS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (54, 'Plecak - khaki', null, 249.00, 'https://img01.ztat.net/article/spp-media-p1/64a3893f11cc4a5d823f3b07d3ee7206/d0a2958312b74caf949ea980c235072f.jpg?imwidth=762', 3, 'ACCESSORIES', 'BACKPACKS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (55, 'Plecak - niebieski', null, 89.00, 'https://img01.ztat.net/article/spp-media-p1/3582b711694b49348cd70345b3844a52/2aed8690271a4780afd06f47ff28e735.jpg?imwidth=762&filter=packshot', 1, 'ACCESSORIES', 'BACKPACKS');
INSERT INTO products (id, name, description, price, url, brand_id, category, subcategory) VALUES (56, 'Plecak - czaerwony', null, 59.00, 'https://img01.ztat.net/article/spp-media-p1/9a705ac27f214fecaa72a82aec36c536/20bb5b624a914f489b63ab48ef0ac889.jpg?imwidth=1800&filter=packshot', 2, 'ACCESSORIES', 'BACKPACKS');
