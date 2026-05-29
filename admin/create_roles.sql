-- ============================================================
-- Snowflake Role Creation Script
-- ============================================================

-- Create roles
CREATE ROLE IF NOT EXISTS NAM_ONENAV_BUSINESS
    COMMENT = 'Read access to views in FIRE_TEST database';

CREATE ROLE IF NOT EXISTS NAM_ONENAV_BUSINESSANALYST
    COMMENT = 'Read access to views and tables in FIRE_TEST database';

-- Grant roles to SYSADMIN to ensure role hierarchy is maintained
GRANT ROLE NAM_ONENAV_BUSINESS        TO ROLE SYSADMIN;
GRANT ROLE NAM_ONENAV_BUSINESSANALYST TO ROLE SYSADMIN;
