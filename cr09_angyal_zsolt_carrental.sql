-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Nov 03. 14:10
-- Kiszolgáló verziója: 10.1.36-MariaDB
-- PHP verzió: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `cr09_angyal_zsolt_carrental`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `fk_return_check_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `fk_return_check_id`, `amount`, `reason`) VALUES
(1, 1, 0, 'none');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `address`
--

INSERT INTO `address` (`address_id`, `country`, `city`, `street`, `number`, `zip_code`) VALUES
(1, 'Hungary', 'Budapest', 'Vaci', 50, 1010);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `seat` int(11) DEFAULT NULL,
  `fuel` varchar(15) DEFAULT NULL,
  `gear` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `car`
--

INSERT INTO `car` (`car_id`, `type`, `model`, `color`, `seat`, `fuel`, `gear`) VALUES
(1, 'Honda', 'CR-V', 'grey', 5, 'benzin', 'automatic');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `fk_customer_detail` int(11) DEFAULT NULL,
  `fk_customer_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email`, `phone`, `fk_customer_detail`, `fk_customer_address`) VALUES
(1, 'John', 'Doe', 'john@doe.com', 61234567, 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customer_deatail`
--

CREATE TABLE `customer_deatail` (
  `customer_detail_id` int(11) NOT NULL,
  `birth_place` varchar(70) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `driver_license` varchar(30) DEFAULT NULL,
  `credit_card_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `customer_deatail`
--

INSERT INTO `customer_deatail` (`customer_detail_id`, `birth_place`, `birth_date`, `driver_license`, `credit_card_num`) VALUES
(1, 'New York', '1970-12-12', '0123456789', 123456789);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_return_check_id` int(11) DEFAULT NULL,
  `fk_additional_charge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_return_check_id`, `fk_additional_charge`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `locations`
--

CREATE TABLE `locations` (
  `locations_id` int(11) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `str_num` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `locations`
--

INSERT INTO `locations` (`locations_id`, `city`, `street`, `str_num`, `zip_code`) VALUES
(1, 'Salgótarján', 'Nyárfa', 2, 3121);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_invoice_id`, `payment_date`, `payment_amount`) VALUES
(1, 1, '2018-11-07', 500);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_pickup_loc_id` int(11) DEFAULT NULL,
  `fk_return_loc_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_customer_id`, `fk_pickup_loc_id`, `fk_return_loc_id`, `fk_car_id`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `return_check`
--

CREATE TABLE `return_check` (
  `return_check_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `return_check`
--

INSERT INTO `return_check` (`return_check_id`, `fk_reservation_id`, `date`) VALUES
(1, 1, '2018-11-07');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_return_check_id` (`fk_return_check_id`);

--
-- A tábla indexei `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- A tábla indexei `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- A tábla indexei `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_address` (`fk_customer_address`),
  ADD KEY `fk_customer_detail` (`fk_customer_detail`);

--
-- A tábla indexei `customer_deatail`
--
ALTER TABLE `customer_deatail`
  ADD PRIMARY KEY (`customer_detail_id`);

--
-- A tábla indexei `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_return_check_id` (`fk_return_check_id`),
  ADD KEY `fk_additional_charge` (`fk_additional_charge`);

--
-- A tábla indexei `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`locations_id`);

--
-- A tábla indexei `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- A tábla indexei `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_pickup_loc_id` (`fk_pickup_loc_id`),
  ADD KEY `fk_return_loc_id` (`fk_return_loc_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- A tábla indexei `return_check`
--
ALTER TABLE `return_check`
  ADD PRIMARY KEY (`return_check_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_return_check_id`) REFERENCES `return_check` (`return_check_id`);

--
-- Megkötések a táblához `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_customer_address`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_customer_detail`) REFERENCES `customer_deatail` (`customer_detail_id`);

--
-- Megkötések a táblához `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_return_check_id`) REFERENCES `return_check` (`return_check_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_additional_charge`) REFERENCES `additional_charges` (`additional_charges_id`);

--
-- Megkötések a táblához `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Megkötések a táblához `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_pickup_loc_id`) REFERENCES `locations` (`locations_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_return_loc_id`) REFERENCES `locations` (`locations_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Megkötések a táblához `return_check`
--
ALTER TABLE `return_check`
  ADD CONSTRAINT `return_check_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
