-- =========================================
-- Smart Healthcare Database
-- Author: Arwa Alyami
-- =========================================

-- ========================
-- Roles Table
-- ========================
CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50),
    RoleDescription VARCHAR(200)
);

INSERT INTO Role VALUES
(1, 'Admin', 'Has full access to all system'),
(2, 'Doctor', 'Can manage patients, appointments, and prescriptions'),
(3, 'Receptionist', 'Can manage appointments'),
(4, 'Pharmacist', 'Can manage medicine inventory and prescriptions'),
(5, 'Patient', 'Can view own appointments and medical records');

-- ========================
-- Users Table
-- ========================
CREATE TABLE UserAccount (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(200),
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

INSERT INTO UserAccount VALUES
(1, 'admin1', 'adminpass', 1),
(2, 'admin2', 'pass123', 2),
(3, 'admin3', 'pass123', 2),
(4, 'admin4', 'receppass', 3),
(5, 'user5', 'pharmapass', 4),
(6, 'user6', 'patientpass', 5),
(7, 'user7', 'patientpass', 5),
(8, 'user8', 'pass123', 2),
(9, 'user9', 'receppass', 3),
(10, 'user10', 'patientpass', 5);

-- ========================
-- Clinics Table
-- ========================
CREATE TABLE Clinic (
    ClinicID INT PRIMARY KEY,
    ClinicName VARCHAR(100),
    City VARCHAR(50),
    Address VARCHAR(255)
);

INSERT INTO Clinic VALUES
(1, 'Riyadh Central Clinic', 'Riyadh', '10 King Fahd St'),
(2, 'Riyadh Eastside Clinic', 'Riyadh', '22 Olaya St'),
(3, 'Riyadh Westside Clinic', 'Riyadh', '35 Prince Sultan St'),
(4, 'Jeddah Downtown Clinic', 'Jeddah', '15 Tahlia St'),
(5, 'Jeddah North Clinic', 'Jeddah', '28 Prince Majed St'),
(6, 'Jeddah South Clinic', 'Jeddah', '40 King Abdulaziz St'),
(7, 'Al Khobar Central Clinic', 'Al Khobar', '5 Prince Turki St'),
(8, 'Al Khobar East Clinic', 'Al Khobar', '12 King Fahd Rd'),
(9, 'Al Khobar West Clinic', 'Al Khobar', '20 Prince Nayef St'),
(10, 'Al Khobar Uptown Clinic', 'Al Khobar', '30 King Abdullah St');

-- ========================
-- Patients Table
-- ========================
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Patient VALUES
(1, 'Reem Ahmed', 'Female', '5555', 'reem@example.com', 'Riyadh'),
(2, 'Huda Saad', 'Female', '5551', 'huda@example.com', 'Riyadh'),
(3, 'Lama Khalid', 'Female', '5552', 'lama@example.com', 'Al Khobar'),
(4, 'Ahmed Fares', 'Male', '5553', 'ahmed@example.com', 'Al Khobar'),
(5, 'Abdullah Mohammed', 'Male', '5554', 'abdullah@example.com', 'Al Khobar'),
(6, 'Hadi Fahad', 'Male', '5556', 'hadi@example.com', 'Jeddah'),
(7, 'Sara Mohammed', 'Female', '5557', 'sara@example.com', 'Jeddah'),
(8, 'Maryam Yousif', 'Female', '5558', 'maryam@example.com', 'Al Khobar'),
(9, 'Dima Abdullah', 'Female', '5559', 'dima@example.com', 'Al Khobar'),
(10, 'Noura Abdulrahman', 'Female', '5510', 'noura@example.com', 'Al Khobar');

-- ========================
-- Doctors Table
-- ========================
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Specialty VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    ClinicID INT,
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

INSERT INTO Doctor VALUES
(101, 'Dr. Khaled Mansour', 'Cardiology', '600000001', 'khaled@example.com', 1),
(102, 'Dr. Lina Luay', 'Dermatology', '600000002', 'lina@example.com', 2),
(103, 'Dr. Faisal Salah', 'Pediatrics', '600000003', 'faisal@example.com', 3),
(104, 'Dr. Rana Fahad', 'Orthopedics', '600000004', 'rana@example.com', 4),
(105, 'Dr. Majed Rashed', 'Neurology', '600000005', 'majed@example.com', 5),
(106, 'Dr. Sara Omar', 'General Medicine', '600000006', 'sara@example.com', 6),
(107, 'Dr. Salim Saad', 'ENT', '600000007', 'salim@example.com', 7),
(108, 'Dr. Huda Omar', 'Ophthalmology', '600000008', 'huda@example.com', 8),
(109, 'Dr. Omar Mourad', 'Gastroenterology', '600000009', 'omar@example.com', 9),
(110, 'Dr. Maha Yaseer', 'Cardiology', '600000010', 'maha@example.com', 10);

-- ========================
-- Appointments Table
-- ========================
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ClinicID INT,
    AppointmentDate DATE,
    StartTime TIME,
    EndTime TIME,
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

INSERT INTO Appointment VALUES
(1001, 1, 101, 1, '2025-12-01', '08:30', '09:00', 'Scheduled'),
(1002, 2, 102, 2, '2025-12-02', '09:15', '09:45', 'Completed'),
(1003, 3, 103, 3, '2025-12-03', '10:00', '10:30', 'Scheduled'),
(1004, 4, 104, 4, '2025-12-04', '11:00', '11:30', 'Cancelled'),
(1005, 5, 105, 5, '2025-12-05', '12:30', '13:00', 'Scheduled'),
(1006, 6, 106, 6, '2025-12-06', '13:15', '13:45', 'Scheduled'),
(1007, 7, 107, 7, '2025-12-07', '14:00', '14:30', 'Completed'),
(1008, 8, 108, 8, '2025-12-08', '15:00', '15:30', 'Scheduled'),
(1009, 9, 109, 9, '2025-12-09', '16:00', '16:30', 'Scheduled'),
(1010, 10, 110, 10, '2025-12-10', '17:00', '17:30', 'Scheduled');

-- ========================
-- Medicines Table
-- ========================
CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(100),
    Type VARCHAR(50),
    Description VARCHAR(255)
);

INSERT INTO Medicine VALUES
(211, 'Vitamin C', 'Tablet', 'Boosts immunity'),
(212, 'Buscopan', 'Tablet', 'Relieves abdominal pain'),
(213, 'Panadol', 'Tablet', 'Pain reliever & fever reducer'),
(214, 'Aspirin', 'Tablet', 'Pain reliever'),
(215, 'Omeprazole', 'Capsule', 'Reduces stomach acid'),
(216, 'Amoxicillin', 'Capsule', 'Antibiotic'),
(217, 'Artelac', 'Eye Drops', 'Moisturizes eyes'),
(218, 'Duspatalin', 'Capsule', 'Relieves gastrointestinal pain'),
(219, 'Stafal Cream', 'Cream', 'Moisturizes facial skin'),
(220, 'Cetirizine', 'Tablet', 'Relieves allergy symptoms');

-- ========================
-- Prescription Table
-- ========================
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    AppointmentID INT,
    MedicineID INT,
    IssueDate DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);

INSERT INTO Prescription VALUES
(2001, 1001, 211, '2025-12-01'),
(2002, 1002, 212, '2025-12-02'),
(2003, 1003, 213, '2025-12-03'),
(2004, 1004, 214, '2025-12-04'),
(2005, 1005, 215, '2025-12-05'),
(2006, 1006, 216, '2025-12-06'),
(2007, 1007, 217, '2025-12-07'),
(2008, 1008, 218, '2025-12-08'),
(2009, 1009, 219, '2025-12-09'),
(2010, 1010, 220, '2025-12-10');

-- ========================
-- Inventory Table
-- ========================
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ClinicID INT,
    MedicineID INT,
    Quantity INT,
    ExpiryDate DATE,
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);

INSERT INTO Inventory VALUES
(1001, 1, 211, 30, '2026-12-20'),
(1002, 2, 212, 25, '2026-11-20'),
(1003, 3, 213, 40, '2026-11-20'),
(1004, 4, 214, 15, '2026-11-20'),
(1005, 5, 215, 60, '2026-11-20'),
(1006, 6, 216, 35, '2026-11-20'),
(1007, 7, 217, 50, '2026-11-20'),
(1008, 8, 218, 20, '2026-11-20'),
(1009, 9, 219, 45, '2026-11-20'),
(1010, 10, 220, 30, '2026-11-20');

-- ========================
-- Billing Table
-- ========================
CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    AppointmentID INT,
    Amount DECIMAL(10,2),
    BillDate DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

INSERT INTO Billing VALUES
(4001, 1001, 150.00, '2025-11-20'),
(4002, 1002, 200.00, '2025-11-21'),
(4003, 1003, 180.00, '2025-11-22'),
(4004, 1004, 250.00, '2025-11-23'),
(4005, 1005, 160.00, '2025-11-24'),
(4006, 1006, 220.00, '2025-11-25'),
(4007, 1007, 190.00, '2025-11-26'),
(4008, 1008, 210.00, '2025-11-27'),
(4009, 1009, 230.00, '2025-11-28'),
(4010, 1010, 170.00, '2025-11-29');

-- ========================
-- Queries
-- ========================

-- Patients with more than one appointment
SELECT p.FullName, COUNT(a.AppointmentID) AS NumAppointments
FROM Patient p
JOIN Appointment a ON p.PatientID = a.PatientID
GROUP BY p.FullName
HAVING COUNT(a.AppointmentID) > 1;

-- Doctors by specialty
SELECT Specialty, COUNT(DoctorID) AS NumDoctors
FROM Doctor
GROUP BY Specialty;

-- Medicines with low stock
SELECT m.MedicineName, i.Quantity, c.ClinicName
FROM Inventory i
JOIN Medicine m ON i.MedicineID = m.MedicineID
JOIN Clinic c ON i.ClinicID = c.ClinicID
WHERE i.Quantity < 20;

-- Upcoming appointments
SELECT a.AppointmentID, p.FullName AS Patient, d.FullName AS Doctor, a.AppointmentDate
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
WHERE a.AppointmentDate >= CURRENT_DATE;