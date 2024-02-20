-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 20 2024 г., 15:25
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `codial`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `t_javob` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `answer`, `t_javob`, `question_id`) VALUES
(1, '4', 1, 1),
(2, '5', 0, 1),
(3, '1', 0, 1),
(4, '2', 0, 1),
(5, '3', 0, 3),
(6, '10', 0, 4),
(7, '9', 1, 4),
(8, '14', 0, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Adabiyot'),
(2, 'matem'),
(4, 'ona tili');

-- --------------------------------------------------------

--
-- Структура таблицы `final_result`
--

CREATE TABLE `final_result` (
  `id` int(11) NOT NULL,
  `hamma_savollar` int(11) NOT NULL,
  `t_javoblar` int(11) NOT NULL,
  `foiz` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `final_result`
--

INSERT INTO `final_result` (`id`, `hamma_savollar`, `t_javoblar`, `foiz`, `user_id`) VALUES
(1, 1, 1, 100, 0),
(2, 3, 1, 33, 0),
(3, 1, 0, 0, 0),
(4, 1, 1, 100, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `categoriya_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `question`, `categoriya_id`) VALUES
(1, 'string', 2),
(2, '2+2', 2),
(3, '1+1', 2),
(4, '1+8', 2),
(5, '1+3', 2),
(6, '1+5', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `results`
--

INSERT INTO `results` (`id`, `question_id`, `category_id`, `answer_id`, `user_id`) VALUES
(1, 2, 2, 4, 0),
(2, 0, 0, 0, 0),
(3, 1, 2, 4, 0),
(4, 3, 2, 5, 0),
(5, 3, 2, 5, 0),
(6, 3, 2, 3, 0),
(7, 3, 2, 3, 0),
(8, 2, 2, 2, 0),
(9, 2, 2, 2, 0),
(10, 2, 2, 2, 0),
(11, 2, 2, 2, 0),
(12, 1, 2, 4, 0),
(14, 1, 2, 7, 0),
(15, 1, 2, 5, 0),
(16, 1, 2, 1, 0),
(17, 1, 2, 3, 0),
(18, 4, 2, 2, 0),
(19, 4, 2, 2, 0),
(20, 4, 2, 2, 0),
(21, 2, 2, 1, 0),
(22, 2, 2, 1, 0),
(23, 2, 2, 1, 0),
(24, 2, 2, 1, 0),
(25, 2, 2, 1, 0),
(26, 2, 2, 1, 0),
(27, 2, 2, 1, 0),
(28, 3, 2, 2, 0),
(29, 2, 2, 1, 0),
(30, 2, 2, 1, 0),
(31, 3, 2, 2, 0),
(32, 3, 2, 2, 0),
(33, 0, 0, 0, 0),
(34, 3, 2, 5, 0),
(35, 3, 2, 5, 0),
(36, 5, 2, 1, 0),
(37, 5, 2, 1, 0),
(38, 5, 2, 1, 0),
(39, 5, 2, 1, 0),
(40, 3, 2, 3, 0),
(41, 4, 2, 5, 0),
(42, 4, 2, 4, 0),
(43, 2, 2, 1, 0),
(44, 3, 2, 4, 0),
(45, 4, 2, 5, 0),
(46, 5, 2, 8, 0),
(47, 2, 2, 1, 0),
(48, 3, 2, 4, 0),
(49, 4, 2, 5, 0),
(50, 5, 2, 8, 0),
(51, 2, 2, 1, 0),
(52, 3, 2, 4, 0),
(53, 4, 2, 5, 0),
(54, 5, 2, 8, 0),
(55, 2, 2, 1, 0),
(56, 3, 2, 4, 0),
(57, 4, 2, 5, 0),
(58, 5, 2, 8, 0),
(59, 2, 2, 1, 0),
(60, 3, 2, 4, 0),
(61, 4, 2, 5, 0),
(62, 5, 2, 8, 0),
(63, 2, 2, 1, 0),
(64, 3, 2, 4, 0),
(65, 4, 2, 5, 0),
(66, 5, 2, 8, 0),
(67, 2, 2, 1, 0),
(68, 3, 2, 4, 0),
(69, 4, 2, 5, 0),
(70, 5, 2, 8, 0),
(71, 2, 2, 1, 0),
(72, 3, 2, 4, 0),
(73, 4, 2, 5, 0),
(74, 5, 2, 8, 0),
(75, 2, 2, 1, 0),
(76, 3, 2, 4, 0),
(77, 4, 2, 5, 0),
(78, 5, 2, 8, 0),
(79, 2, 2, 1, 0),
(80, 3, 2, 4, 0),
(81, 4, 2, 5, 0),
(82, 5, 2, 8, 0),
(83, 2, 2, 1, 0),
(84, 3, 2, 4, 0),
(85, 4, 2, 5, 0),
(86, 5, 2, 8, 0),
(87, 2, 2, 1, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `token`) VALUES
(1, 'nuriddin', 'Nuriddin', '$2b$12$lScNpX/s2nQ5njbFQ7.iWOMdqndQ7Unq.ZrBcbqaZQoJSY2pBPdU2', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJOdXJpZGRpbiIsImV4cCI6MTcwNzc4OTM2NX0.TbnXuFpLud1VzetaaCbGQN-q7MstiSVB21dpjE_J4Rk'),
(2, 'n', 'nnn', '$2b$12$sjvb7ezwLyPY8LPgidmVquv1kLD58Q5YCOcMxJ1zJBsQ35o5Olzae', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJubm4iLCJleHAiOjE3MDc3OTE3NjF9.OJev-mYTmfuH1McbA0QphvBKpWuyBNz76NHbWPJOo8c'),
(3, 'nuriddin', 'Nuriddin9797', '$2b$12$NjC9u4VoUDhNohFHQ2BBjuVwO05Wqu5KDkct2hcTgxc0Ild3a1x4u', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJOdXJpZGRpbjk3OTciLCJleHAiOjE3MDc4NDA3NDZ9.9q9GZ-rPzw9mF4PlS27-i2LAwK7b_JJqnnJJvgeBNn8'),
(4, 'string', 'string', '$2b$12$Bcn3yaF6BWGC8P7hnvXNp.dEI7no5.rd8NAm7r0Ge9Qqr4vmMpJoO', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzdHJpbmciLCJleHAiOjE3MDc4NDIwODR9._xZM9C8EQOl1OyAs49klvKSDGvDJF6WucALuGlpPJrc'),
(5, 'Nuriddin', 'Ergashev', '$2b$12$8YS5IQJf9iF6xPvY4YA6PebsFVlS/sQfkDQeTIuox1b4RYGi7XtOe', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJFcmdhc2hldiIsImV4cCI6MTcwODA1NjA1N30.kvtI4U5j9xX0CjMMP4bwZ2pwoYvrFGjG38-rSCBaj64'),
(6, 'dkasnkn', 'stasdasing', '$2b$12$Uj8zLuzMcYg1xv2n3HUjTu4WD/kUWIVAot1XxlGFnJtMWhcnUhrY6', 'admin', 'Nuriddin'),
(7, 'Nuriddin1001', 'Nuriddin979797', '$2b$12$wiSrCkiy8NFpCxWnK6PENOTWNZsGwIpfQSfY1oAeChGcMVmOClwYe', 'admin', 'Nuriddin'),
(8, 'dkasnkn', 'stasdasing', '$2b$12$qEjsk1zLo4BtR7XFRAC4beEFlbiMpZtzZ05wfeQMdCkdprv3ir.fu', 'admin', 'Nuriddin'),
(9, 'ali', 'ali', '$2b$12$eQIrYgYbTZIduKjbnD32DeVi0uwcXP6Tsej/b6Zj1JK9kW0S67axG', 'User', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhbGkiLCJleHAiOjE3MDc4NjczMzB9.Duo-f3zAj9BAW1wbMsCyjWQ_xt4f2uUUu6BkLkBC6-U'),
(10, 'stringcvv', 'stringvsdv', '$2b$12$eNnJ8j5AMGlT76NehN3XhuOjCR95iGTxrmZVrAfuNguhw6EyDOQ6O', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzdHJpbmd2c2R2IiwiZXhwIjoxNzA3ODc5NjUzfQ.r9KCPilZ82CXbLdxgR4ZbmWz79ibsMqypHQ7RNg9Bv8'),
(11, 'string', 'string123', '$2b$12$Q0wGUx4YPmlpR4PEverCUOGUrkrIQ076wxZpMrvK0V0ZO1Mcu0AoK', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzdHJpbmcxMjMiLCJleHAiOjE3MDc5MzQzMTN9.Ti_K5T7WjNvRvG4fIYz1eCFApJ43YY2ACCwoDpTewBU'),
(12, 'string', 'string123', '$2b$12$NLG7h1GVQhncsHac3kVdEuw5257QKCbrY6gmIY1yvU9EL8B38.c/y', 'user', 'Nuriddin'),
(13, 'admin', 'admin9797', '$2b$12$tqprdeZp5D4zT6U7ynbi4O1m09OxvVkw43F0bn91ho65bft64dt..', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbjk3OTciLCJleHAiOjE3MDg0NjIxMjV9.j8jUaKzF1AxXBfL-_hKMQuDouW9RA-PWP7_edpRJEB4'),
(14, 'stringdg', 'striythdfng', '$2b$12$IjCuhuPVyum3n3mcYwGv3eQYkLhXui1JW2LWJAZkLvVnHokNcB6h2', 'user', 'Nuriddin'),
(15, 'navkjfdnvkd', 'vadfvd', '$2b$12$zXJmTH3ePgETaaq72RkpPuC9PZiqh.RL0cNkAZB4ObgRVl7J0523i', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2YWRmdmQiLCJleHAiOjE3MDgyOTAwNDB9.11fTYg9L4bk_dq2-fQ2F3oUZ8vwWWbVePKlnWpWv1Xs'),
(16, 'dsd', 'nnnnn', '$2b$12$CfIUyyvm1Xpgjb4Trt0Vce.ypEOcZPNofbXW/5UInb3UGPVtUbKXu', 'admin', 'Nuriddin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `final_result`
--
ALTER TABLE `final_result`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `final_result`
--
ALTER TABLE `final_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
