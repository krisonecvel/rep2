USE YETICAVE;

INSERT INTO categories SET id = 1, name = 'Доски и лыжи';
INSERT INTO categories SET id = 2, name = 'Крепления';
INSERT INTO categories SET id = 3, name = 'Ботинки';
INSERT INTO categories SET id = 4, name = 'Одежда';
INSERT INTO categories SET id = 5, name = 'Инструменты';
INSERT INTO categories SET id = 6, name = 'Разное';

INSERT INTO users (id, date_register, email, name, password, contacts) VALUES
(1, '2016-08-10 00:00:00', 'Oleg19@gmail.com', 'Oleg', '12345oleg', 'telegram - 999245'),
(2, '2015-03-02 00:00:00', 'Anastas2000@mail.ru', 'Anastasia', '12345anast', 'vk - 2943'),
(3, '2015-01-05 00:00:00', 'igorka@gmail.ru', 'Igor', '12345igor', 'odnoklasniki - 0943');

INSERT INTO lots (name, adv_category_id, start_price, date_end, image_url, date_create, bet_step, author_id) VALUES
('2014 Rossignol District Snowboard', 1, 10999, CURRENT_DATE() - INTERVAL 1 HOUR, 'img/lot-1.jpg', NOW() - INTERVAL 1 WEEK, 100, 2),
('DC Ply Mens 2016/2017 Snowboard', 1, 159999, '2018-10-10 00:00:00', 'img/lot-2.jpg', '2018-09-22 00:00:00', 200, 3),
('Крепления Union Contact Pro 2015 года размер L/XL', 2, 8000, '2018-10-02 00:00:00', 'img/lot-3.jpg', '2018-09-21 00:00:00', 400, 1),
('Ботинки для сноуборда DC Mutiny Charocal', 3, 10999, '2018-10-02 00:00:00', 'img/lot-4.jpg', '2018-09-18 00:00:00', 500, 1),
('Куртка для сноуборда DC Mutiny Charocal', 4, 7500, '2018-10-01 00:00:00', 'img/lot-5.jpg', '2018-09-25 00:00:00', 800, 2),
('Маска Oakley Canopy', 6, 5400, '2018-10-21 00:00:00', 'img/lot-6.jpg', '2018-09-22 00:00:00', 450, 3);


INSERT INTO bets SET date_create = '2018-09-25 00:00:00', price = 7500, user_id = 3, lot_id = 5;
INSERT INTO bets SET date_create = '2018-09-21 00:00:00', price = 8000, user_id = 2, lot_id = 3;
INSERT INTO bets SET date_create = '2018-09-22 00:00:00', price = 159999, user_id = 1, lot_id = 2;
INSERT INTO bets SET date_create = '2018-09-22 00:00:00', price = 5400, user_id = 2, lot_id = 6;

-- 1. получить все категории
-- SELECT * FROM categories

-- 2. получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, количество ставок, название категории
-- SELECT
-- lots.name AS lot_name,
-- lots.start_price AS lot_start_price,
-- lots.image_url,
-- lots.date_create,
-- lots.date_end,
-- lots.bet_step,
-- COUNT(bets.lot_id) AS bets_number,
-- categories.name AS category_name
-- FROM lots
-- JOIN bets
-- ON lots.id = bets.lot_id
-- JOIN categories
-- ON lots.adv_category_id = categories.id
-- WHERE lots.date_end > CURDATE()
-- GROUP BY bets.lot_id
-- ORDER BY lots.date_create DESC

-- 3. Показать лот по его id. Получите также название категории, к которой принадлежит лот
-- SELECT * FROM lots JOIN categories ON lots.adv_category_id = categories.id WHERE lots.id = 2;

-- 4. Обновить название лота по его идентификатору;
-- UPDATE lots SET name = 'измененный лот' WHERE id = 1;

-- 5. Получить список самых свежих ставок для лота по его идентификатору;
-- SELECT * FROM bets JOIN lots ON bets.lot_id = lots.id WHERE lots.id = 1 ORDER BY bets.date_create DESC;
