-- ============================================================
-- Snowflake Role Creation Script
-- ============================================================
-- Prerequisites: Must be run as ACCOUNTADMIN or a role with
-- CREATE ROLE privilege.
-- Note: SVC64198_ROLE and G54774_ROLE are assumed to be
-- pre-existing roles and are NOT created here.
-- ============================================================


-- ============================================================
-- SECTION 1: Create functional (NAM_ONENAV) roles
-- ============================================================

CREATE ROLE IF NOT EXISTS NAM_ONENAV_BUSINESS
    COMMENT = 'Read access to views in FIRE_TEST database';

CREATE ROLE IF NOT EXISTS NAM_ONENAV_BUSINESSANALYST
    COMMENT = 'Read access to views and tables in FIRE_TEST database';

CREATE ROLE IF NOT EXISTS NAM_ONENAV_DEVELOPER
    COMMENT = 'Read and write access to all objects in FIRE_TEST database';

CREATE ROLE IF NOT EXISTS NAM_ONENAV_OPERATOR
    COMMENT = 'Read and write access to all objects in FIRE_TEST database';

CREATE ROLE IF NOT EXISTS NAM_ONENAV_SERVICEACCOUNT
    COMMENT = 'Service account access for FIRE_TEST database';


-- ============================================================
-- SECTION 2: Create security (SEC_ROLE_NIFSA) roles
-- ============================================================

CREATE ROLE IF NOT EXISTS SEC_ROLE_NIFSA_FUNDREPORTING
    COMMENT = 'Security role for NIFSA Fund Reporting team';

CREATE ROLE IF NOT EXISTS SEC_ROLE_NIFSA_IWDDATAENABLEMENT_DEVELOPER
    COMMENT = 'Security role for NIFSA IWD Data Enablement developers';

CREATE ROLE IF NOT EXISTS SEC_ROLE_NIFSA_IWDDATAENABLEMENT_BA
    COMMENT = 'Security role for NIFSA IWD Data Enablement business analysts';

CREATE ROLE IF NOT EXISTS SEC_ROLE_NIFSA_ITOPS
    COMMENT = 'Security role for NIFSA IT Operations team';


-- ============================================================
-- SECTION 3: Grant all roles to SYSADMIN (role hierarchy)
-- ============================================================

GRANT ROLE NAM_ONENAV_BUSINESS                      TO ROLE SYSADMIN;
GRANT ROLE NAM_ONENAV_BUSINESSANALYST               TO ROLE SYSADMIN;
GRANT ROLE NAM_ONENAV_DEVELOPER                     TO ROLE SYSADMIN;
GRANT ROLE NAM_ONENAV_OPERATOR                      TO ROLE SYSADMIN;
GRANT ROLE NAM_ONENAV_SERVICEACCOUNT                TO ROLE SYSADMIN;
GRANT ROLE SEC_ROLE_NIFSA_FUNDREPORTING             TO ROLE SYSADMIN;
GRANT ROLE SEC_ROLE_NIFSA_IWDDATAENABLEMENT_DEVELOPER TO ROLE SYSADMIN;
GRANT ROLE SEC_ROLE_NIFSA_IWDDATAENABLEMENT_BA      TO ROLE SYSADMIN;
GRANT ROLE SEC_ROLE_NIFSA_ITOPS                     TO ROLE SYSADMIN;


-- ============================================================
-- SECTION 4: Assign SEC_ROLE_NIFSA roles into NAM_ONENAV roles
-- ============================================================

-- Fund Reporting users inherit Business (view read) access
GRANT ROLE SEC_ROLE_NIFSA_FUNDREPORTING               TO ROLE NAM_ONENAV_BUSINESS;

-- IWD Data Enablement developers inherit Developer (read/write) access
GRANT ROLE SEC_ROLE_NIFSA_IWDDATAENABLEMENT_DEVELOPER TO ROLE NAM_ONENAV_DEVELOPER;

-- IWD Data Enablement BAs inherit Business Analyst (table+view read) access
GRANT ROLE SEC_ROLE_NIFSA_IWDDATAENABLEMENT_BA        TO ROLE NAM_ONENAV_BUSINESSANALYST;

-- IT Ops inherit Operator (read/write) access
GRANT ROLE SEC_ROLE_NIFSA_ITOPS                       TO ROLE NAM_ONENAV_OPERATOR;


-- ============================================================
-- SECTION 5: Assign pre-existing roles into new roles
-- ============================================================

-- Service account role inherits Service Account access
GRANT ROLE SVC64198_ROLE TO ROLE NAM_ONENAV_SERVICEACCOUNT;

-- AD group role inherits IWD Developer access
GRANT ROLE G54774_ROLE   TO ROLE SEC_ROLE_NIFSA_IWDDATAENABLEMENT_DEVELOPER;
