CREATE HOSPITAL DATABASE(( 
CREATE TABLE patient_data(
    patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR,
    phone_number VARCHAR,
    next_of_kin VARCHAR,
    locatio_ID INT(11),
    date_added DATE,
    update_date DATE,
    FOREIGN KEY (location_ID)
); 

CREATE TABLE training(
    training_ID INT(11),PRIMARY KEY AUTO_INCREMENT
    user_ID INT(11),
    training_type VARCHAR(100),
    training_date DATE,
    complrtion_status VARCHAR,
    FOREIGN KEY (user_ID) REFERENCES user(user_ID)
);
    
CREATE TABLE epidiological_data(
    data_ID INT (11),
    location_ID INT(11),
    recorded_date DATE,
    cases_per_athousand_people INT (11),
    rainfall INT(11),
    average_temperature DECIMAL(5,2),
    update_date DATE
    added_by INT,
    FOREIGN KEY(Location_ID) REFERENCES geographical_location(location_ID)
);
CREATE TABLE supply_chain(
    supply_ID INT(11),
    resources_ID INT(11),
    facility_ID INT(11),
    quatity_shipped INT(11),
    shipment_date DATE,
    expected_arrival_date DATE,
    shipped_by INT(11),
    status VARCHAR(50),
    update_date DATE,
    FOREIGN KEY (facility_ID) REFERENCES healthy_facility(facility_ID),
    FOREIGN KEY (resource_ID) REFERENCES resource (resource_ID)
);
CREATE TABLE geographical_location(
    location_ID INT(11),
    village VARCHAR(100),
    parish VARCHAR(100),
    county VARCHAR(100),
    region VARCHAR(100),
    population INT(11),
    coordinates VARCHAR(100),
    malaria_risk_level VARCHAR(50),
    healthy_facility_count INT(11)
    ITN_coverage DECIMAL(5,2),
    Reported_cases INT
);
CREATE TABLE resources(
    resource_ID INT(11),
    facility_ID INT(11),
    resource_type VARCHAR(50),
    quality INT(11),
    last_update_date DATE,
    description TEXT,
    date_added DATE,
    update_date DATE,
    FOREIGN KEY (facility_ID) REFERENCES resource_type(resource_ID)
);
CREATE TABLE treatment(
    treatment_ID INT(11),
    treatment_namer VARCHAR(50),
    treatment_description TEXT,
    dosage VARCHAR(50),
    side_effects TEXT,
    date_added DATE,
    update_date DATE
);
CREATE TABLE visit_record(
    visit_ID INT(11),
    patient_ID INT(11),
    visit_number INT(11),
    visit_date DATE,
    date_added DATE,
    update_date DATE,
    facility_ID INT(11),
    FOREIGN KEY (patient_ID, facility_ID) 
                 
);
CREATE TABLE referral(
    referral_ID INT(11),
    case_ID INT(11),
    referred_form INT(11),
    referred_to INT(11),
    referral_date DATE,
    reason TEXT,
    outcome_ID INT(11),
    update_date DATE,
    referred_by INT(11),
    FOREIGN KEY (case_ID, outcome_ID)
);
CREATE TABLE user (
    user_ID INT(11),PRIMARY KEY ,AUTO_INCREMENT
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    preferred_name VARCHAR(50),
    role_ID INT (11),
    username VARCHAR(50),
    password VARCHAR(50),
    facility_ID INT(11),
    FOREIGN KEY (facility_ID, role_ID)
);
CREATE TABLE malaria_type(
    type_ID INT(11),
    type_name VARCHAR(50),
    description TEXT,
    date_added DATE,
    added_by INT(11),
    update_date DATE,
    FOREIGN KEY ()
);
CREATE TABLE user_role(
    role_ID INT(11),
    role_name VARCHAR(50),
    role_description TEXT,
    date_added DATE,
    update_date DATE,
    FOREIGN KEY() REFERENCES user(user_ID)
);
CREATE TABLE laboratory_test(
    test_ID INT(11),
    case_ID INT(11),
    test_type VARCHAR(50),
    test_result VARCHAR(50),
    test_date DATE,
    technician_ID INT(11),
    FOREIGN KEY (case_ID, technician_ID) REFERENCES case(case_ID)
);

CREATE TABLE healthy_facility(
    facility_ID INT (11) PRIMARY KEY AUTO_INCREMENT,
    facility_name VARCHAR(100),
    location_ID INT(11),
    facility_type INT(11),
    capacity INT(11),
    contact_details VARCHAR (100),
    date_added DATE,
    facility_head VARCHAR (100),
    FOREIGN KEY (location_ID)
);
CREATE TABLE interventions(
    intervention_ID INT(11),
    type VARCHAR(50),
    location_ID INT(11),
    start_date DATE,
    end_date DATE,
    outcome VARCHAR(50)
    date_added DATE,
    update_date DATE
);
CREATE TABLE malaria_cases(
    case_ID INT(11),
    patient_ID INT(11),
    facility_ID INT(11),
    date_of_diagnosis DATE,
    type_of_malaria VARCHAR(50),
    treatment_ID INT(11),
    outcome_ID INT(11),
    FOREIGN KEY (patient_ID, facility_ID, treatment_ID, outcomr_ID)
);
CREATE TABLE facility(
    facility_type_ID INT(11),
    Name VARCHAR(50),
    description TEXT,
    date_added DATE,
    date_updated DATE
);
CREATE TABLE system_log(
    log_ID INT(11),
    user_ID INT(11),
    activity TEXT,
    temestamp DATETIME,
    IP_address VARCHAR(100),
    location VARCHAR(100)
);
    
