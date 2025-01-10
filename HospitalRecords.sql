CREATE TABLE user_role (
    role_ID INT PRIMARY KEY,
    role_name VARCHAR(50),
    role_description TEXT,
    date_added DATE,
    update_date DATE
);

CREATE TABLE treatment (
    treatment_ID INT PRIMARY KEY,
    treatment_name VARCHAR(50),
    treatment_description TEXT,
    dosage VARCHAR(50),
    side_effects TEXT,
    date_added DATE,
    update_date DATE
);

CREATE TABLE outcome (
    outcome_ID INT PRIMARY KEY,
    outcome_name VARCHAR(50),
    description TEXT
);

CREATE TABLE malaria_type (
    type_ID INT PRIMARY KEY,
    type_name VARCHAR(50),
    description TEXT,
    date_added DATE,
    added_by INT,
    update_date DATE
);

CREATE TABLE resources (
    resource_ID INT PRIMARY KEY,
    resource_type VARCHAR(50),
    quality INT,
    last_update_date DATE,
    description TEXT,
    date_added DATE,
    update_date DATE
);

CREATE TABLE geographical_location (
    location_ID INT PRIMARY KEY,
    village VARCHAR(100),
    parish VARCHAR(100),
    county VARCHAR(100),
    region VARCHAR(100),
    population INT,
    coordinates VARCHAR(100),
    malaria_risk_level VARCHAR(50),
    healthy_facility_count INT,
    ITN_coverage DECIMAL(5,2),
    Reported_cases INT
);

CREATE TABLE healthy_facility (
    facility_ID INT PRIMARY KEY AUTO_INCREMENT,
    facility_name VARCHAR(100),
    location_ID INT,
    facility_type INT,
    capacity INT,
    contact_details VARCHAR(100),
    date_added DATE,
    facility_head VARCHAR(100),
    FOREIGN KEY (location_ID) REFERENCES geographical_location(location_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE user (
    user_ID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    preferred_name VARCHAR(50),
    role_ID INT NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, 
    facility_ID INT NOT NULL,
    FOREIGN KEY (facility_ID) REFERENCES healthy_facility(facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_ID) REFERENCES user_role(role_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE patient_data (
    patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(15),
    next_of_kin VARCHAR(100),
    location_ID INT,
    date_added DATE,
    update_date DATE,
    FOREIGN KEY (location_ID) REFERENCES geographical_location(location_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE training (
    training_ID INT PRIMARY KEY AUTO_INCREMENT,
    user_ID INT,
    training_type VARCHAR(100),
    training_date DATE,
    completion_status VARCHAR(50),
    FOREIGN KEY (user_ID) REFERENCES user(user_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE malaria_cases (
    case_ID INT PRIMARY KEY,
    patient_ID INT,
    facility_ID INT,
    date_of_diagnosis DATE,
    type_of_malaria VARCHAR(50),
    treatment_ID INT,
    outcome_ID INT,
    FOREIGN KEY (patient_ID) REFERENCES patient_data(patient_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (facility_ID) REFERENCES healthy_facility(facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (treatment_ID) REFERENCES treatment(treatment_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (outcome_ID) REFERENCES outcome(outcome_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE referral (
    referral_ID INT PRIMARY KEY,
    case_ID INT,
    referred_from INT,
    referred_to INT,
    referral_date DATE,
    reason TEXT,
    outcome_ID INT,
    update_date DATE,
    referred_by INT,
    FOREIGN KEY (case_ID) REFERENCES malaria_cases(case_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (outcome_ID) REFERENCES outcome(outcome_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE visit_record (
    visit_ID INT PRIMARY KEY,
    patient_ID INT,
    visit_number INT,
    visit_date DATE,
    date_added DATE,
    update_date DATE,
    facility_ID INT,
    FOREIGN KEY (patient_ID) REFERENCES patient_data(patient_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (facility_ID) REFERENCES healthy_facility(facility_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE supply_chain (
    supply_ID INT PRIMARY KEY,
    resources_ID INT,
    facility_ID INT,
    quantity_shipped INT,
    shipment_date DATE,
    expected_arrival_date DATE,
    shipped_by INT,
    status VARCHAR(50),
    update_date DATE,
    FOREIGN KEY (facility_ID) REFERENCES healthy_facility(facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (resources_ID) REFERENCES resources(resource_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE system_log (
    log_ID INT PRIMARY KEY,
    user_ID INT,
    activity TEXT,
    timestamp DATETIME,
    IP_address VARCHAR(100),
    location VARCHAR(100),
    FOREIGN KEY (user_ID) REFERENCES user(user_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE interventions (
    intervention_ID INT PRIMARY KEY,
    type VARCHAR(50),
    location_ID INT,
    start_date DATE,
    end_date DATE,
    outcome VARCHAR(50),
    date_added DATE,
    update_date DATE,
    FOREIGN KEY (location_ID) REFERENCES geographical_location(location_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE laboratory_test (
    test_ID INT PRIMARY KEY,
    case_ID INT,
    test_type VARCHAR(50),
    test_result VARCHAR(50),
    test_date DATE,
    technician_ID INT,
    FOREIGN KEY (case_ID) REFERENCES malaria_cases(case_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (technician_ID) REFERENCES user(user_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
