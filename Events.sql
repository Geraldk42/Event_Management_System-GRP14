create database Event;
--
-- Table structure for table `booking_status_logs`
--

CREATE TABLE `booking_status_logs` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `old_status` varchar(200) DEFAULT NULL,
  `new_status` varchar(200) DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_status_logs`
--

INSERT INTO `booking_status_logs` (`id`, `booking_id`, `old_status`, `new_status`, `changed_at`) VALUES
(1, 123456789, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(2, 123456790, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(3, 123456791, 'Pending', 'Cancelled', '2024-11-21 11:42:40'),
(4, 123456792, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(5, 123456793, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(6, 123456794, 'Pending', 'Cancelled', '2024-11-21 11:42:40'),
(7, 123456795, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(8, 123456796, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(9, 123456797, 'Pending', 'Cancelled', '2024-11-21 11:42:40'),
(10, 123456798, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(11, 123456799, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(12, 123456800, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(13, 123456801, 'Pending', 'Cancelled', '2024-11-21 11:42:40'),
(14, 123456802, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(15, 123456803, 'Pending', 'Cancelled', '2024-11-21 11:42:40'),
(16, 123456804, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(17, 123456805, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(18, 123456806, 'Pending', 'Cancelled', '2024-11-21 11:42:40'),
(19, 123456807, 'Approved', 'Cancelled', '2024-11-21 11:42:40'),
(20, 123456808, 'Approved', 'Cancelled', '2024-11-21 11:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createuser` varchar(255) DEFAULT NULL,
  `deleteuser` varchar(255) DEFAULT NULL,
  `createbid` varchar(255) DEFAULT NULL,
  `updatebid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission`, `createuser`, `deleteuser`, `createbid`, `updatebid`) VALUES
(1, 'Superuser', '1', '1', '1', '1'),
(2, 'Admin', '1', NULL, '1', '1'),
(3, 'Manager', '1', NULL, '1', '1'),
(4, 'Supervisor', NULL, NULL, '1', '1'),
(5, 'Event Coordinator', NULL, NULL, '1', '1'),
(6, 'Booking Agent', NULL, NULL, '1', NULL),
(7, 'Staff', NULL, NULL, '1', NULL),
(8, 'Junior Staff', NULL, NULL, NULL, NULL),
(9, 'Trainee', NULL, NULL, NULL, NULL),
(10, 'Vendor', NULL, NULL, NULL, NULL),
(11, 'Client Manager', NULL, NULL, '1', '1'),
(12, 'Finance Manager', '1', NULL, '1', '1'),
(13, 'Marketing Manager', NULL, NULL, '1', '1'),
(14, 'Operations Manager', '1', NULL, '1', '1'),
(15, 'HR Manager', '1', '1', NULL, NULL),
(16, 'Support Staff', NULL, NULL, NULL, NULL),
(17, 'Quality Control', NULL, NULL, '1', '1'),
(18, 'Customer Service', NULL, NULL, '1', NULL),
(19, 'Guest Relations', NULL, NULL, '1', NULL),
(20, 'Intern', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `Staffid` varchar(255) DEFAULT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT 1,
  `Photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'avatar15.jpg',
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `Staffid`, `AdminName`, `UserName`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Status`, `Photo`, `Password`, `AdminRegdate`) VALUES
(1, 'SA001', 'Super Admin', 'superadmin', 'John', 'Doe', 9876543210, 'john.doe@events.com', 1, 'admin1.jpg', '0192023a7bbd73250516f069df18b500', '2023-01-01 07:00:00'),
(2, 'SA002', 'Event Manager', 'eventmgr', 'Jane', 'Smith', 9876543211, 'jane.smith@events.com', 1, 'admin2.jpg', 'd325ffe191a600f562fb59ae52ccbc75', '2023-01-02 07:00:00'),
(3, 'SA003', 'Operations Head', 'opshead', 'Michael', 'Johnson', 9876543212, 'michael.j@events.com', 1, 'admin3.jpg', 'd5d126684ac9630c107e55b7f0e76ff5', '2023-01-03 07:00:00'),
(4, 'SA004', 'Finance Manager', 'finmgr', 'Sarah', 'Williams', 9876543213, 'sarah.w@events.com', 1, 'admin4.jpg', 'ddf04a0a99986b0624a38ceea702be76', '2023-01-04 07:00:00'),
(5, 'SA005', 'Marketing Lead', 'mktlead', 'Robert', 'Brown', 9876543214, 'robert.b@events.com', 1, 'admin5.jpg', 'd84f8fcb02903f2f7909d3296fc751bb', '2023-01-05 07:00:00'),
(6, 'SA006', 'HR Manager', 'hrmgr', 'Emily', 'Davis', 9876543215, 'emily.d@events.com', 1, 'admin6.jpg', '0df1f19150ec76698e143f8f35d9c834', '2023-01-06 07:00:00'),
(7, 'SA007', 'Event Coordinator', 'coordinator', 'David', 'Miller', 9876543216, 'david.m@events.com', 1, 'admin7.jpg', '4123570adeabe94c748e3bbeb7c883ca', '2023-01-07 07:00:00'),
(8, 'SA008', 'Booking Manager', 'bookingmgr', 'Lisa', 'Wilson', 9876543217, 'lisa.w@events.com', 1, 'admin8.jpg', '6209af25efb234ece470ed36709bf79f', '2023-01-08 07:00:00'),
(9, 'SA009', 'Customer Service', 'custserv', 'James', 'Taylor', 9876543218, 'james.t@events.com', 1, 'admin9.jpg', '028992d5d5378be53ba0dc1fe4db9204', '2023-01-09 07:00:00'),
(10, 'SA010', 'Tech Support', 'techsupp', 'Emma', 'Anderson', 9876543219, 'emma.a@events.com', 1, 'admin10.jpg', '66854f1b110143269dbffdd806fa66eb', '2023-01-10 07:00:00'),
(11, 'SA011', 'Quality Manager', 'qualitymgr', 'William', 'Thomas', 9876543220, 'william.t@events.com', 1, 'admin11.jpg', '0ca448201bd3717be6214c9557e573dc', '2023-01-11 07:00:00'),
(12, 'SA012', 'Logistics Head', 'logishead', 'Olivia', 'Martin', 9876543221, 'olivia.m@events.com', 1, 'admin12.jpg', '8d6ae58fb304f32fd1205381be8e4e28', '2023-01-12 07:00:00'),
(13, 'SA013', 'Security Head', 'sechead', 'Daniel', 'Lee', 9876543222, 'daniel.l@events.com', 1, 'admin13.jpg', '6e4eee8e391a062865ce4f2fddcb115c', '2023-01-13 07:00:00'),
(14, 'SA014', 'Vendor Manager', 'vendormgr', 'Sophia', 'White', 9876543223, 'sophia.w@events.com', 1, 'admin14.jpg', '4522b549b4f2a0eeb98946c80b7b3dc5', '2023-01-14 07:00:00'),
(15, 'SA015', 'Accounts Manager', 'accmgr', 'Matthew', 'Clark', 9876543224, 'matthew.c@events.com', 1, 'admin15.jpg', '88cb150cb9bf9223ea2db35c9b59449a', '2023-01-15 07:00:00'),
(16, 'SA016', 'Staff Supervisor', 'supervisor', 'Ava', 'Lewis', 9876543225, 'ava.l@events.com', 1, 'admin16.jpg', '7ec638b0ce6a360927fd45fbbe5a45f3', '2023-01-16 07:00:00'),
(17, 'SA017', 'Training Manager', 'trainmgr', 'Joseph', 'Young', 9876543226, 'joseph.y@events.com', 1, 'admin17.jpg', '02272a83f4df576ec82d69a0eab2418a', '2023-01-17 07:00:00'),
(18, 'SA018', 'Client Relations', 'clientrel', 'Isabella', 'Hall', 9876543227, 'isabella.h@events.com', 1, 'admin18.jpg', '2bdfc95a15f4bb7e05a3403a9d908706', '2023-01-18 07:00:00'),
(19, 'SA019', 'Business Dev', 'businessdev', 'Andrew', 'King', 9876543228, 'andrew.k@events.com', 1, 'admin19.jpg', '5f089be645b2f2a8e0b1b2e4844f378f', '2023-01-19 07:00:00'),
(20, 'SA020', 'Operations Exec', 'opsexec', 'Mia', 'Wright', 9876543229, 'mia.w@events.com', 1, 'admin20.jpg', 'e3b6bcb239ba907e2b9c5e5f2c41332e', '2023-01-20 07:00:00'),
(21, 'U003', 'TestAdmin', 'testadmin', 'Test', 'Admin', 9876543210, 'testadmin@example.com', 1, 'avatar15.jpg', '482c811da5d5b4bc6d497ffa98491e38', '2024-11-21 11:04:41'),
(22, 'U004', 'TestAdmin2', 'testadmin2', 'Test2', 'Admin2', 9876543220, 'testadmin2@example.com', 1, 'avatar15.jpg', '482c811da5d5b4bc6d497ffa98491e38', '2024-11-21 11:05:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `ID` int(10) NOT NULL,
  `BookingID` int(10) DEFAULT NULL,
  `ServiceID` int(10) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `EventDate` varchar(200) DEFAULT NULL,
  `EventStartingtime` varchar(200) DEFAULT NULL,
  `EventEndingtime` varchar(200) DEFAULT NULL,
  `VenueAddress` mediumtext DEFAULT NULL,
  `EventType` varchar(200) DEFAULT NULL,
  `AdditionalInformation` mediumtext DEFAULT NULL,
  `BookingDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`ID`, `BookingID`, `ServiceID`, `Name`, `MobileNumber`, `Email`, `EventDate`, `EventStartingtime`, `EventEndingtime`, `VenueAddress`, `EventType`, `AdditionalInformation`, `BookingDate`, `Remark`, `Status`, `UpdationDate`) VALUES
(1, 123456789, 1, 'John Smith', 9876543210, 'john.smith@email.com', '2024-01-15', '18:00', '23:00', '123 Wedding Lane, New York', 'Wedding', 'Premium decoration with white theme', '2023-12-15 07:00:00', 'Confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(2, 123456790, 2, 'Emily Brown', 9876543211, 'emily.brown@email.com', '2024-01-20', '12:00', '16:00', '456 Party Ave, Boston', 'Birthday Party', 'Kids birthday party with entertainment', '2023-12-16 08:00:00', 'Deposit paid', 'Cancelled', '2024-11-21 11:42:40'),
(3, 123456791, 3, 'Michael Wilson', 9876543212, 'michael.w@email.com', '2024-01-25', '19:00', '23:00', '789 Corporate Blvd, Chicago', 'Corporate Conference', 'Annual company meeting', '2023-12-17 09:00:00', 'Pending payment', 'Cancelled', '2024-11-21 11:42:40'),
(4, 123456792, 4, 'Sarah Johnson', 9876543213, 'sarah.j@email.com', '2024-02-01', '17:00', '22:00', '321 Engagement St, Miami', 'Engagement', 'Romantic setup required', '2023-12-18 10:00:00', 'Confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(5, 123456793, 5, 'David Lee', 9876543214, 'david.lee@email.com', '2024-02-05', '09:00', '18:00', '654 Exhibition Rd, Las Vegas', 'Trade Show', 'Tech exhibition setup', '2023-12-19 11:00:00', 'Special requirements noted', 'Cancelled', '2024-11-21 11:42:40'),
(6, 123456794, 6, 'Lisa Anderson', 9876543215, 'lisa.a@email.com', '2024-02-10', '16:00', '20:00', '987 Fashion Ave, Los Angeles', 'Fashion Show', 'Runway and lighting setup', '2023-12-20 12:00:00', 'Technical check pending', 'Cancelled', '2024-11-21 11:42:40'),
(7, 123456795, 7, 'Robert Taylor', 9876543216, 'robert.t@email.com', '2024-02-15', '18:30', '23:30', '147 Celebration Rd, Houston', 'Anniversary', '25th anniversary celebration', '2023-12-21 13:00:00', 'Confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(8, 123456796, 8, 'Jennifer White', 9876543217, 'jennifer.w@email.com', '2024-02-20', '11:00', '15:00', '258 Community Ctr, Phoenix', 'Charity', 'Fundraising event setup', '2023-12-22 14:00:00', 'Venue confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(9, 123456797, 9, 'Thomas Harris', 9876543218, 'thomas.h@email.com', '2024-02-25', '19:00', '23:00', '369 Award Ave, Seattle', 'Award Ceremony', 'Company awards night', '2023-12-23 15:00:00', 'AV check required', 'Cancelled', '2024-11-21 11:42:40'),
(10, 123456798, 10, 'Mary Martin', 9876543219, 'mary.m@email.com', '2024-03-01', '10:00', '16:00', '741 Product Rd, San Francisco', 'Product Launch', 'New tech product launch', '2023-12-24 16:00:00', 'Confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(11, 123456799, 11, 'James Wilson', 9876543220, 'james.w@email.com', '2024-03-05', '14:00', '18:00', '852 Seminar St, Denver', 'Seminar', 'Business leadership seminar', '2023-12-25 17:00:00', 'Speaker confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(12, 123456800, 12, 'Patricia Clark', 9876543221, 'patricia.c@email.com', '2024-03-10', '17:00', '22:00', '963 Party Ln, Atlanta', 'Cocktail', 'Corporate mixer event', '2023-12-26 18:00:00', 'Menu finalized', 'Cancelled', '2024-11-21 11:42:40'),
(13, 123456801, 13, 'George Rodriguez', 9876543222, 'george.r@email.com', '2024-03-15', '16:00', '20:00', '159 College Rd, Boston', 'College', 'Graduation ceremony', '2023-12-27 19:00:00', 'Pending final numbers', 'Cancelled', '2024-11-21 11:42:40'),
(14, 123456802, 14, 'Elizabeth Lopez', 9876543223, 'elizabeth.l@email.com', '2024-03-20', '19:00', '23:59', '267 Club Ave, Miami', 'Night Club', 'New Year party', '2023-12-28 20:00:00', 'Security arranged', 'Cancelled', '2024-11-21 11:42:40'),
(15, 123456803, 15, 'Joseph Martinez', 9876543224, 'joseph.m@email.com', '2024-03-25', '11:00', '15:00', '348 Sports Complex, Chicago', 'Sports Event', 'Corporate sports day', '2023-12-29 07:00:00', 'Equipment check pending', 'Cancelled', '2024-11-21 11:42:40'),
(16, 123456804, 16, 'Sandra Lee', 9876543225, 'sandra.l@email.com', '2024-04-01', '18:00', '22:00', '459 Wedding Plaza, Houston', 'Pre Engagement', 'Family gathering', '2023-12-30 08:00:00', 'Confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(17, 123456805, 17, 'Kevin Brown', 9876543226, 'kevin.b@email.com', '2024-04-05', '09:00', '17:00', '570 Temple Rd, Phoenix', 'Religious', 'Annual religious gathering', '2023-12-31 09:00:00', 'Special arrangements noted', 'Cancelled', '2024-11-21 11:42:40'),
(18, 123456806, 18, 'Michelle Turner', 9876543227, 'michelle.t@email.com', '2024-04-10', '16:00', '21:00', '681 Community Hall, Seattle', 'Social', 'Community meetup', '2024-01-01 10:00:00', 'Venue setup pending', 'Cancelled', '2024-11-21 11:42:40'),
(19, 123456807, 19, 'Daniel King', 9876543228, 'daniel.k@email.com', '2024-04-15', '17:00', '22:00', '792 Sangeet Hall, San Francisco', 'Sangeet', 'Pre-wedding celebration', '2024-01-02 11:00:00', 'Confirmed', 'Cancelled', '2024-11-21 11:42:40'),
(20, 123456808, 20, 'Rachel Green', 9876543229, 'rachel.g@email.com', '2024-04-20', '18:00', '23:00', '803 Reception Ave, Los Angeles', 'Post Wedding', 'Reception party', '2024-01-03 12:00:00', 'Decoration finalized', 'Cancelled', '2024-11-21 11:42:40');

CREATE TABLE `tblcompany` (
  `id` int(11) NOT NULL,
  `regno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `companyname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `companyemail` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `companyphone` text NOT NULL,
  `companyaddress` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `companylogo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'avatar15.jpg',
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `tblcompany` (`id`, `regno`, `companyname`, `companyemail`, `country`, `companyphone`, `companyaddress`, `companylogo`, `status`, `creationdate`) VALUES
(1, 'REG001', 'Elite Events', 'contact@eliteevents.com', 'USA', '+1234567890', '123 Main St, New York', 'logo1.jpg', '1', '2022-12-31 21:00:00'),
(2, 'REG002', 'Royal Celebrations', 'info@royalcelebrations.com', 'UK', '+2345678901', '456 High St, London', 'logo2.jpg', '1', '2023-01-01 21:00:00'),
(3, 'REG003', 'Dream Makers', 'contact@dreammakers.com', 'Canada', '+3456789012', '789 Queen St, Toronto', 'logo3.jpg', '1', '2023-01-02 21:00:00'),
(4, 'REG004', 'Perfect Planners', 'info@perfectplanners.com', 'Australia', '+4567890123', '321 King St, Sydney', 'logo4.jpg', '1', '2023-01-03 21:00:00'),
(5, 'REG005', 'Glamour Events', 'contact@glamourevents.com', 'France', '+5678901234', '654 Rue Paris, Paris', 'logo5.jpg', '1', '2023-01-04 21:00:00'),
(6, 'REG006', 'Star Celebrations', 'info@starcelebrations.com', 'Germany', '+6789012345', '987 Berlin St, Berlin', 'logo6.jpg', '1', '2023-01-05 21:00:00'),
(7, 'REG007', 'Golden Moments', 'contact@goldenmoments.com', 'Spain', '+7890123456', '147 Madrid Ave, Madrid', 'logo7.jpg', '1', '2023-01-06 21:00:00'),
(8, 'REG008', 'Silver Lining Events', 'info@silverlining.com', 'Italy', '+8901234567', '258 Rome Rd, Rome', 'logo8.jpg', '1', '2023-01-07 21:00:00'),
(9, 'REG009', 'Premier Events', 'contact@premierevents.com', 'Japan', '+9012345678', '369 Tokyo St, Tokyo', 'logo9.jpg', '1', '2023-01-08 21:00:00'),
(10, 'REG010', 'Luxury Affairs', 'info@luxuryaffairs.com', 'Singapore', '+0123456789', '741 Marina Bay, Singapore', 'logo10.jpg', '1', '2023-01-09 21:00:00'),
(11, 'REG011', 'Classic Events', 'contact@classicevents.com', 'India', '+1122334455', '852 Mumbai Rd, Mumbai', 'logo11.jpg', '1', '2023-01-10 21:00:00'),
(12, 'REG012', 'Modern Celebrations', 'info@moderncelebrations.com', 'Brazil', '+2233445566', '963 Rio St, Rio', 'logo12.jpg', '1', '2023-01-11 21:00:00'),
(13, 'REG013', 'Platinum Events', 'contact@platinumevents.com', 'Mexico', '+3344556677', '159 Mexico City, Mexico', 'logo13.jpg', '1', '2023-01-12 21:00:00'),
(14, 'REG014', 'Diamond Celebrations', 'info@diamondcelebrations.com', 'UAE', '+4455667788', '267 Dubai Mall, Dubai', 'logo14.jpg', '1', '2023-01-13 21:00:00'),
(15, 'REG015', 'Crown Events', 'contact@crownevents.com', 'Russia', '+5566778899', '348 Moscow Rd, Moscow', 'logo15.jpg', '1', '2023-01-14 21:00:00'),
(16, 'REG016', 'Supreme Events', 'info@supremeevents.com', 'China', '+6677889900', '459 Beijing St, Beijing', 'logo16.jpg', '1', '2023-01-15 21:00:00'),
(17, 'REG017', 'Exclusive Affairs', 'contact@exclusiveaffairs.com', 'Malaysia', '+7788990011', '570 KL Tower, Kuala Lumpur', 'logo17.jpg', '1', '2023-01-16 21:00:00'),
(18, 'REG018', 'Grand Celebrations', 'info@grandcelebrations.com', 'Thailand', '+8899001122', '681 Bangkok Ave, Bangkok', 'logo18.jpg', '1', '2023-01-17 21:00:00'),
(19, 'REG019', 'Imperial Events', 'contact@imperialevents.com', 'Vietnam', '+9900112233', '792 Hanoi Rd, Hanoi', 'logo19.jpg', '1', '2023-01-18 21:00:00'),
(20, 'REG020', 'Majestic Celebrations', 'info@majesticcelebrations.com', 'Indonesia', '+0011223344', '803 Jakarta St, Jakarta', 'logo20.jpg', '1', '2023-01-19 21:00:00');

CREATE TABLE `tbleventtype` (
  `ID` int(10) NOT NULL,
  `EventType` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `tbleventtype` (`ID`, `EventType`, `CreationDate`) VALUES
(19, 'Corporate Conference', '2023-01-19 07:00:00'),
(20, 'Product Launch', '2023-01-20 07:00:00'),
(21, 'Fashion Show', '2023-01-21 07:00:00'),
(22, 'Award Ceremony', '2023-01-22 07:00:00'),
(23, 'Sports Event', '2023-01-23 07:00:00'),
(24, 'Trade Show', '2023-01-24 07:00:00'),
(25, 'Seminar', '2023-01-25 07:00:00');

CREATE TABLE `tblservice` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `SerDes` varchar(250) NOT NULL,
  `ServicePrice` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tblservice` (`ID`, `ServiceName`, `SerDes`, `ServicePrice`, `CreationDate`) VALUES
(1, 'Party decorations', 'we finish designing 4 hours before your ceremony.', '8000', '2022-01-24 04:17:43'),
(2, 'Party DJ', 'we install the DJ equipment 1 hour before your selected event start time.', '700', '2022-01-24 04:18:32'),
(3, 'Ceremony Music', 'Our ceremony music service is a popular add on to our wedding DJ stay all day hire.', '650', '2022-01-24 04:19:14'),
(4, 'Photo Booth Hire', 'we install the DJ equipment before your ceremony.', '500', '2022-01-24 04:19:51'),
(6, 'Uplighters', 'Uplighters are bright lighting fixtures which are installed on the floor and shine a vibrant wash of color over the walls of your venue.', '200', '2022-01-24 04:21:14'),
(1, 'Premium Decoration Package', 'Luxury decorations with premium flowers and lighting', '15000', '2023-01-01 07:00:00'),
(2, 'Standard Decoration Package', 'Standard decorations with seasonal flowers', '8000', '2023-01-02 07:00:00'),
(3, 'Professional DJ Services', 'Experienced DJ with premium sound system', '5000', '2023-01-03 07:00:00'),
(4, 'Live Band Performance', 'Professional 5-piece band for live music', '12000', '2023-01-04 07:00:00'),
(5, 'Photography Package', 'Professional event photography with editing', '8000', '2023-01-05 07:00:00'),
(6, 'Videography Package', '4K video coverage with drone shots', '10000', '2023-01-06 07:00:00'),
(7, 'Catering Service - Premium', 'Gourmet menu with international cuisine', '25000', '2023-01-07 07:00:00'),
(8, 'Catering Service - Standard', 'Local cuisine with variety options', '15000', '2023-01-08 07:00:00'),
(9, 'Photo Booth Setup', 'Professional photo booth with props', '3000', '2023-01-09 07:00:00'),
(10, 'LED Wall Display', 'Large LED wall with technical support', '20000', '2023-01-10 07:00:00'),
(11, 'Sound System Rental', 'Professional sound system setup', '7000', '2023-01-11 07:00:00'),
(12, 'Lighting Package', 'Premium lighting setup with effects', '6000', '2023-01-12 07:00:00'),
(13, 'Stage Setup', 'Professional stage with backdrop', '9000', '2023-01-13 07:00:00'),
(14, 'Security Service', 'Professional security team', '4000', '2023-01-14 07:00:00'),
(15, 'Valet Parking', 'Professional valet parking service', '3500', '2023-01-15 07:00:00'),
(16, 'Flower Arrangement', 'Premium flower decoration service', '5500', '2023-01-16 07:00:00'),
(17, 'Kids Entertainment', 'Professional kids entertainment team', '4500', '2023-01-17 07:00:00'),
(18, 'Bar Service', 'Professional bartenders and setup', '8500', '2023-01-18 07:00:00'),
(19, 'Cleanup Service', 'Post-event cleanup service', '3000', '2023-01-19 07:00:00'),
(20, 'Event Planning', 'Complete event planning service', '15000', '2023-01-20 07:00:00');

CREATE TABLE `vw_active_bookings` (
`BookingID` int(10)
,`Name` varchar(200)
,`EventDate` varchar(200)
,`EventStartingtime` varchar(200)
,`EventEndingtime` varchar(200)
,`EventType` varchar(200)
,`ServiceName` varchar(200)
,`ServicePrice` varchar(200)
,`Status` varchar(200)
);

CREATE TABLE `vw_admin_activity` (
`Staffid` varchar(255)
,`full_name` varchar(511)
,`Email` varchar(200)
,`total_bookings_handled` bigint(21)
,`last_booking_handled` timestamp
);

DROP TABLE IF EXISTS `vw_active_bookings`;

DROP TABLE IF EXISTS `vw_admin_activity`;


ALTER TABLE `booking_status_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_status_logs`
--
ALTER TABLE `booking_status_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
