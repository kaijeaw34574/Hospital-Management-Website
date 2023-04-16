-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2022 at 02:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chaos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `hospital_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_email_address`, `admin_password`, `admin_name`, `hospital_name`, `hospital_address`, `hospital_contact_no`, `hospital_logo`) VALUES
(1, 'kkk@gmail.com', 'password', 'Doc A', 'Chaos Hospital', '123456 chaos St.', '088777666', '../images/1764303333.png');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_table`
--

CREATE TABLE `appointment_table` (
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_schedule_id` int(11) NOT NULL,
  `appointment_number` int(11) NOT NULL,
  `reason_for_appointment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_come_into_hospital` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appointment_table`
--

INSERT INTO `appointment_table` (`appointment_id`, `doctor_id`, `patient_id`, `doctor_schedule_id`, `appointment_number`, `reason_for_appointment`, `appointment_time`, `status`, `patient_come_into_hospital`, `doctor_comment`, `price`) VALUES
(3, 1, 3, 2, 1000, 'Pain in Stomach', '09:00:00', 'Cancel', 'No', '', 0),
(4, 1, 3, 2, 1001, 'Pain in stomach', '09:00:00', 'Completed', 'Yes', 'Give birth to a baby\r\n', 10000),
(5, 1, 4, 2, 1002, 'Pain in the chest', '09:30:00', 'Completed', 'Yes', 'She had a cardiac arrest.', 1000),
(6, 5, 3, 7, 1003, 'Fever and cold.', '18:00:00', 'In Process', 'Yes', 'Corona virus (SARS COV-2)', 500),
(7, 6, 5, 13, 1004, 'Pain in Stomach.', '15:30:00', 'Completed', 'Yes', 'Acidity Problem. ', 250),
(8, 1, 3, 10, 1005, 'HeadAche', '12:00:00', 'Completed', 'Yes', 'Just a normal brain cancer', 20000),
(9, 4, 6, 12, 1006, 'Trauma\r\n', '16:00:00', 'Cancel', 'No', '', 0),
(10, 3, 4, 11, 1007, 'Stomach Ache\r\n', '14:00:00', 'Completed', 'Yes', 'Stomach cancer \\n Please go to toilet', 0),
(11, 4, 4, 15, 1008, 'HeadAche\r\n', '10:01:00', 'In Process', 'Yes', 'Brain Cancer', 14000),
(12, 8, 4, 17, 1009, 'I got shocked by a AA battery', '08:00:00', 'Cancel', 'Yes', 'Next time try climbing a electic-fence.\r\n', 0),
(13, 1, 8, 10, 1010, 'Chest problem', '12:20:00', 'Completed', 'Yes', 'Have a cardiac arrest.', 233),
(15, 2, 4, 19, 1012, 'Chest pain\r\n', '08:30:00', 'Completed', 'Yes', 'Breast Cancer', 1232),
(16, 7, 4, 21, 1013, 'Had a back pain for three days ', '08:59:00', 'Completed', 'Yes', 'Should focus more on exercise and get a good sleep', 250);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule_table`
--

CREATE TABLE `doctor_schedule_table` (
  `doctor_schedule_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_schedule_date` date NOT NULL,
  `doctor_schedule_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_schedule_start_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_schedule_end_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `average_consulting_time` int(5) NOT NULL,
  `doctor_schedule_status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_schedule_table`
--

INSERT INTO `doctor_schedule_table` (`doctor_schedule_id`, `doctor_id`, `doctor_schedule_date`, `doctor_schedule_day`, `doctor_schedule_start_time`, `doctor_schedule_end_time`, `average_consulting_time`, `doctor_schedule_status`) VALUES
(4, 5, '2022-10-27', 'Friday', '10:00', '14:00', 10, 'Active'),
(10, 1, '2022-11-17', 'Wednesday', '12:00', '15:00', 20, 'Active'),
(11, 3, '2022-11-01', 'Wednesday', '14:00', '17:00', 5, 'Active'),
(12, 4, '2022-10-31', 'Wednesday', '16:00', '20:00', 5, 'Active'),
(15, 4, '2022-11-01', 'Tuesday', '10:01', '14:02', 10, 'Active'),
(16, 4, '2022-11-01', 'Tuesday', '08:00', '17:00', 20, 'Active'),
(17, 8, '2022-11-01', 'Tuesday', '08:00', '17:00', 30, 'Active'),
(18, 3, '2022-11-02', 'Wednesday', '08:45', '17:45', 10, 'Active'),
(19, 2, '2022-11-29', 'Tuesday', '08:30', '17:00', 20, 'Active'),
(20, 1, '2022-11-29', 'Tuesday', '08:30', '17:30', 20, 'Active'),
(21, 7, '2022-11-30', 'Wednesday', '08:59', '13:50', 10, 'Active'),
(22, 3, '2022-11-30', 'Wednesday', '08:35', '17:35', 5, 'Active'),
(23, 3, '2022-12-01', 'Thursday', '12:55', '21:30', 10, 'Active'),
(24, 8, '2022-12-01', 'Thursday', '08:30', '17:30', 10, 'Active'),
(25, 4, '2022-12-02', 'Friday', '08:30', '17:30', 15, 'Active'),
(26, 2, '2022-12-06', 'Tuesday', '00:30', '08:30', 20, 'Active'),
(27, 7, '2022-12-01', 'Thursday', '08:30', '17:30', 20, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_table`
--

CREATE TABLE `doctor_table` (
  `doctor_id` int(11) NOT NULL,
  `doctor_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_profile_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_phone_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_date_of_birth` date NOT NULL,
  `doctor_degree` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_expert_in` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_table`
--

INSERT INTO `doctor_table` (`doctor_id`, `doctor_email_address`, `doctor_password`, `doctor_name`, `doctor_profile_image`, `doctor_phone_no`, `doctor_address`, `doctor_date_of_birth`, `doctor_degree`, `doctor_expert_in`, `doctor_status`, `doctor_added_on`) VALUES
(1, 'Doc_earth@gmail.com', 'password', 'Dr. Earth Supawut', '../images/1048321011.jpg', '0999999999', '1234, Kmutt St.', '2022-09-28', 'MBBS', 'Cardiologist', 'Active', '2021-02-15 17:04:59'),
(2, 'adamsmith@gmail.com', 'password', 'Dr. Adam smith', '../images/241945649.jpg', '1234345666', '111, King luay St', '1982-08-10', 'MBBS MD(Cardiac)', 'Cardiologist', 'Active', '2021-02-18 15:00:32'),
(3, 'Mike@gmail.com', 'password', 'Dr. Mike Tyson', '../images/43976308.jpg', '1234455555', '11, Tyson St.', '2022-09-05', 'MBBS', 'Gynecologist', 'Active', '2021-02-18 15:05:02'),
(4, 'Elon@gmail.com', 'password', 'Dr. Yi long ma', '../images/1830212168.jpg', '2131231', '11, MilkShake St.', '1984-06-11', 'MBBS MD', 'Neurologist', 'Active', '2021-02-18 15:08:24'),
(7, 'bill@gmail.com', 'password', 'Dr. Bill gates', '../images/2144427191.jpg', '077888999', '2 Bill St', '2022-10-11', 'MBBS MD', 'Physician', 'Active', '2022-10-31 17:26:37'),
(8, 'pik@gmail.com', 'password', 'Dr. Pika Chu', '../images/1232741136.jpg', '066666666', '69 St.', '2022-10-30', 'MBBS MD', 'Neurologist', 'Active', '2022-10-31 21:08:26'),
(9, 'men@gmail.com', 'password', 'men', '../images/1751869743.jpg', '6969696969', '111', '2022-11-22', 'Kindergarten', 'Cardiologist', 'Active', '2022-11-23 20:53:00'),
(10, 'drsteven@gmail.com', 'password', 'Steven', '../images/1507789308.png', 'Stone', '1134, MilkShake St.', '2022-11-27', 'MBBS MD', 'Neurologist', 'Active', '2022-11-28 00:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `patient_table`
--

CREATE TABLE `patient_table` (
  `patient_id` int(11) NOT NULL,
  `patient_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `patient_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_date_of_birth` date NOT NULL,
  `patient_gender` enum('Male','Female','Other') COLLATE utf8_unicode_ci NOT NULL,
  `patient_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `patient_phone_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_maritial_status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_added_on` datetime NOT NULL,
  `patient_verification_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_verify` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_table`
--

INSERT INTO `patient_table` (`patient_id`, `patient_email_address`, `patient_password`, `patient_first_name`, `patient_last_name`, `patient_date_of_birth`, `patient_gender`, `patient_address`, `patient_phone_no`, `patient_maritial_status`, `patient_added_on`, `patient_verification_code`, `email_verify`) VALUES
(3, 'a@gmail.com', 'password', 'Gorilla', 'Inthezoo', '2021-02-26', 'Male', 'Tasmania devil\r\n', '85745635210', 'Single', '2021-02-18 16:34:55', 'b1f3f8409f7687072adb1f1b7c22d4b0', 'Yes'),
(4, 'orisa@gmail.com', 'password', 'Orisa', 'Roadhog', '2022-10-12', 'Female', '1234 Owl St.', '7539518520', 'Single', '2021-02-19 18:28:23', '8902e16ef62a556a8e271c9930068fea', 'Yes'),
(6, 's@gmail.com', 'password', 'Reinhardt', 'Dva', '2022-10-10', 'Male', 'Junker town', '0886667777', 'Single', '2022-10-31 14:03:46', '23baabecf375416862b7d4388e5dc050', 'Yes'),
(8, 'abc@gmail.com', 'password', 'test', 'test', '2022-10-17', 'Male', '9 Baker St.', '099999999', 'Single', '2022-11-01 10:42:25', '1efd8cbd7a600b95169ded1ff69bdfdf', 'Yes'),
(9, 'ip@gmail.com', 'password', 'Issac', 'Pendulum', '2022-11-27', 'Male', '2345 queen st.', '0123456789', 'Single', '2022-11-28 00:31:41', '22b844644295aaaef51f7cc51b3e120e', 'Yes'),
(10, 'abcaa@gmail.com', 'password', 'tests', 'ssss', '2022-11-27', 'Male', 'qweqw as', '8574563521033', 'Single', '2022-11-28 14:40:41', '4b76f41753408e4e44dd5d2506fb23d2', 'Yes'),
(11, 'asda@gmail.com', 'password', 'asdffds', 'kajdfla`', '2022-11-07', 'Male', '231 st sde', '01234567891312', 'Single', '2022-11-28 14:41:36', '67a8c94aa2b719fd91a9d01fba0daa83', 'Yes'),
(12, 'asdas@gmail.com', 'password', 'lakdjaklsdjlf', 'aslskdfas', '2022-11-27', 'Male', '23 St hershow', '12312352123', 'Single', '2022-11-28 14:44:44', 'c17a42954076015321f13beec442361a', 'Yes'),
(13, 'aasdww@gmail.com', 'password', 'Nameis', 'Blue', '2022-11-27', 'Male', '234234 st . Sho', '1231231', 'Single', '2022-11-28 14:47:06', 'e665711621761b3f73b18e89df5dc342', 'Yes'),
(14, 'asdaasdasdsad@gmail.com', 'password', 'palista', 'sumota', '2022-11-27', 'Male', '123123 St. Polo', '2342342', 'Single', '2022-11-28 14:48:42', 'd1a5606b388d4fd395cc7b51c11ace23', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  ADD PRIMARY KEY (`doctor_schedule_id`);

--
-- Indexes for table `doctor_table`
--
ALTER TABLE `doctor_table`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `patient_table`
--
ALTER TABLE `patient_table`
  ADD PRIMARY KEY (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_table`
--
ALTER TABLE `appointment_table`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  MODIFY `doctor_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `doctor_table`
--
ALTER TABLE `doctor_table`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `patient_table`
--
ALTER TABLE `patient_table`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
