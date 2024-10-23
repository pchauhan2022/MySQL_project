CREATE DATABASE Healthcare;
USE Healthcare;

-- Patient Table-- 

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    contact_info VARCHAR(100),
    address VARCHAR(200),
    medical_history TEXT
);

-- Doctors Table--

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    contact_info VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Departments Table --

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

-- Appointments Table--

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Medical Records --

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    treatment TEXT,
    prescription TEXT,
    FOREIGN KEY (patient_id)
        REFERENCES Patients (patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors (doctor_id)
);

-- Billing Table--

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);


-- Staff Table --

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    contact_info VARCHAR(100)
);

-- Insert data into Patients table--

INSERT INTO Patients (patient_id, name, age, gender, contact_info, address, medical_history) VALUES
(1, 'Anil Sharma', 30, 'Male', '1234567890', 'Pune', 'Hypertension'),
(2, 'Bhumika Verma', 25, 'Female', '2345678901', 'Mumbai', 'Asthma'),
(3, 'Chetan Gupta', 40, 'Male', '3456789012', 'Delhi', 'None'),
(4, 'Dhruv Jain', 28, 'Male', '4567890123', 'Jaipur', 'Diabetes'),
(5, 'Enameul Patel', 35, 'Male', '5678901234', 'Pune', 'Heart Disease'),
(6, 'Farah Khan', 22, 'Female', '6789012345', 'Mumbai', 'Allergies'),
(7, 'Gaurav Mehta', 50, 'Male', '7890123456', 'Delhi', 'None'),
(8, 'Hina Kapoor', 31, 'Female', '8901234567', 'Jaipur', 'Thyroid Issues'),
(9, 'Iqbal Ansari', 27, 'Male', '9012345678', 'Pune', 'Back Pain'),
(10, 'Jaya Singh', 29, 'Female', '0123456789', 'Mumbai', 'Migraines'),
(11, 'Karan Sharma', 45, 'Male', '1234567891', 'Delhi', 'Hypertension'),
(12, 'Lata Desai', 33, 'Female', '2345678902', 'Jaipur', 'Anemia'),
(13, 'Mohit Kumar', 38, 'Male', '3456789013', 'Pune', 'Asthma'),
(14, 'Nisha Rao', 26, 'Female', '4567890124', 'Mumbai', 'None'),
(15, 'Om Prakash', 54, 'Male', '5678901235', 'Delhi', 'Diabetes'),
(16, 'Pooja Mehta', 37, 'Female', '6789012346', 'Jaipur', 'High Cholesterol'),
(17, 'Rohan Verma', 32, 'Male', '7890123457', 'Pune', 'Hypertension'),
(18, 'Seema Bansal', 44, 'Female', '8901234568', 'Mumbai', 'Back Pain'),
(19, 'Tarun Singh', 39, 'Male', '9012345679', 'Delhi', 'None'),
(20, 'Usha Gupta', 41, 'Female', '0123456790', 'Jaipur', 'Osteoporosis'),
(21, 'Vikram Joshi', 48, 'Male', '1234567892', 'Pune', 'Diabetes'),
(22, 'Yashika Rao', 24, 'Female', '2345678903', 'Mumbai', 'None'),
(23, 'Zara Khan', 36, 'Female', '3456789014', 'Delhi', 'Migraines'),
(24, 'Aarav Mehta', 29, 'Male', '4567890125', 'Jaipur', 'Allergies'),
(25, 'Deepak Yadav', 52, 'Male', '5678901236', 'Pune', 'Heart Disease'),
(26, 'Ekta Malhotra', 25, 'Female', '6789012347', 'Mumbai', 'None'),
(27, 'Firoz Ansari', 34, 'Male', '7890123458', 'Delhi', 'Diabetes'),
(28, 'Garima Sharma', 38, 'Female', '8901234569', 'Jaipur', 'High Blood Pressure'),
(29, 'Harsh Gupta', 30, 'Male', '9012345680', 'Pune', 'None'),
(30, 'Isha Rani', 41, 'Female', '0123456791', 'Mumbai', 'Asthma');


-- Insert data into doctors table--

INSERT INTO Doctors (doctor_id, name, specialization, contact_info, department_id) VALUES
(1, 'Dr. Amit Sharma', 'Cardiologist', '1234567890', 1),
(2, 'Dr. Neha Gupta', 'Neurologist', '2345678901', 2),
(3, 'Dr. Raj Malhotra', 'Orthopedic Surgeon', '3456789012', 3),
(4, 'Dr. Priya Kapoor', 'Pediatrician', '4567890123', 4),
(5, 'Dr. Arjun Mehta', 'General Surgeon', '5678901234', 5),
(6, 'Dr. Sanjay Khanna', 'Radiologist', '6789012345', 6),
(7, 'Dr. Kavita Singh', 'Cardiologist', '7890123456', 1),
(8, 'Dr. Ankit Desai', 'Neurologist', '8901234567', 2),
(9, 'Dr. Ramesh Yadav', 'Orthopedic Surgeon', '9012345678', 3),
(10, 'Dr. Sunita Bansal', 'Pediatrician', '0123456789', 4);

-- Insert data into departments table--

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'General Surgery'),
(6, 'Radiology');

-- Insert data into appointments table --

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, 1, '2024-01-15', 'Scheduled'),
(2, 2, 2, '2024-01-16', 'Completed'),
(3, 3, 3, '2024-01-17', 'Cancelled'),
(4, 4, 4, '2024-01-18', 'Scheduled'),
(5, 5, 5, '2024-01-19', 'Completed'),
(6, 6, 6, '2024-01-20', 'Scheduled'),
(7, 7, 1, '2024-01-21', 'Completed'),
(8, 8, 2, '2024-01-22', 'Cancelled'),
(9, 9, 3, '2024-01-23', 'Scheduled'),
(10, 10, 4, '2024-01-24', 'Completed');

-- Insert data into medical records table --

INSERT INTO Medical_Records (record_id, patient_id, doctor_id, diagnosis, treatment, prescription) VALUES
(1, 1, 1, 'Hypertension', 'Lifestyle changes', 'Lisinopril'),
(2, 2, 2, 'Asthma', 'Inhaler prescribed', 'Albuterol'),
(3, 3, 3, 'None', 'Routine checkup', 'None'),
(4, 4, 4, 'Diabetes', 'Insulin prescribed', 'Metformin'),
(5, 5, 5, 'Heart Disease', 'Surgery', 'Aspirin'),
(6, 6, 6, 'Allergies', 'Antihistamine', 'Cetirizine'),
(7, 7, 1, 'None', 'Routine checkup', 'None'),
(8, 8, 2, 'Thyroid Issues', 'Medication adjustment', 'Levothyroxine'),
(9, 9, 3, 'Back Pain', 'Physical therapy', 'Ibuprofen'),
(10, 10, 4, 'Migraines', 'Pain relief', 'Sumatriptan');


-- Insert data into billing table --

INSERT INTO Billing (bill_id, patient_id, total_amount, payment_status) VALUES
(1, 1, 500.00, 'Paid'),
(2, 2, 300.00, 'Pending'),
(3, 3, 0.00, 'Paid'),
(4, 4, 450.00, 'Paid'),
(5, 5, 700.00, 'Paid'),
(6, 6, 200.00, 'Pending'),
(7, 7, 600.00, 'Paid'),
(8, 8, 350.00, 'Pending'),
(9, 9, 0.00, 'Paid'),
(10, 10, 250.00, 'Paid');

-- Insert data into staff table --

INSERT INTO Staff (staff_id, name, role, contact_info) VALUES
(1, 'Anjali Sharma', 'Nurse', '1234567890'),
(2, 'Vikram Joshi', 'Receptionist', '2345678901'),
(3, 'Poonam Rani', 'Medical Assistant', '3456789012'),
(4, 'Manoj Kumar', 'Nurse', '4567890123'),
(5, 'Riya Desai', 'Billing Specialist', '5678901234'),
(6, 'Sameer Patel', 'Pharmacist', '6789012345'),
(7, 'Neeta Singh', 'Administrator', '7890123456'),
(8, 'Aakash Yadav', 'Nurse', '8901234567'),
(9, 'Kiran Gupta', 'Receptionist', '9012345678'),
(10, 'Jitendra Raghav', 'Medical Technologist', '0123456789');

-- Count the number of patients in each department --

SELECT d.department_name, COUNT(p.patient_id) AS patient_count
FROM Departments d
LEFT JOIN Doctors doc ON d.department_id = doc.department_id
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
LEFT JOIN Patients p ON a.patient_id = p.patient_id
GROUP BY d.department_name;

-- Calculate the average age of patients in each department--

SELECT d.department_name, AVG(p.age) AS average_age
FROM Departments d
LEFT JOIN Doctors doc ON d.department_id = doc.department_id
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
LEFT JOIN Patients p ON a.patient_id = p.patient_id
GROUP BY d.department_name;

-- Identify the most common diagnoses in each department --

SELECT d.department_name, mr.diagnosis, COUNT(*) AS diagnosis_count
FROM Departments d
LEFT JOIN Doctors doc ON d.department_id = doc.department_id
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
LEFT JOIN Medical_Records mr ON a.patient_id = mr.patient_id
GROUP BY d.department_name, mr.diagnosis
ORDER BY d.department_name, diagnosis_count DESC;

-- Calculate the average billing amount for each treatment type--

SELECT mr.treatment, AVG(b.total_amount) AS average_billing
FROM MedicalRecords mr
LEFT JOIN Billing b ON mr.patient_id = b.patient_id
GROUP BY mr.treatment;


-- Determine the average number of appointments per patient --

SELECT p.name, COUNT(a.appointment_id) AS appointment_count
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.name;


--  Find all doctors who specialize in 'Cardiology' --

SELECT * FROM Doctors
WHERE specialization LIKE 'Cardiologist';

-- Retrieve all patients with names starting with 'A' -- 

SELECT * FROM Patients
WHERE name LIKE 'A%';

-- List all medical records along with the doctor who treated the patient--

SELECT mr.record_id, p.name AS patient_name, d.name AS doctor_name, mr.diagnosis, mr.treatment
FROM Medical_Records mr
LEFT JOIN Patients p ON mr.patient_id = p.patient_id
LEFT JOIN Doctors d ON mr.doctor_id = d.doctor_id;

-- Retrieve doctors who have treated patients with 'Diabetes'--

SELECT DISTINCT d.name AS doctor_name
FROM Doctors d
JOIN Medical_Records mr ON d.doctor_id = mr.doctor_id
JOIN Patients p ON mr.patient_id = p.patient_id
WHERE mr.diagnosis LIKE '%Diabetes%';


-- List all appointments along with patient names and doctors --

SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date, a.status
FROM Appointments a
LEFT JOIN Patients p ON a.patient_id = p.patient_id
LEFT JOIN Doctors d ON a.doctor_id = d.doctor_id;


-- Find patients who have appointments scheduled in January-- 

SELECT p.name, a.appointment_date
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_date LIKE '2024-01%';

-- Get the highest billing amount and the corresponding patient --

SELECT p.name AS patient_name, b.total_amount
FROM Patients p
JOIN Billing b ON p.patient_id = b.patient_id
WHERE b.total_amount = (SELECT MAX(total_amount) FROM Billing);

-- List departments that have no patients treated --

SELECT d.department_name
FROM Departments d
LEFT JOIN Doctors doc ON d.department_id = doc.department_id
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
LEFT JOIN Patients p ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;


















