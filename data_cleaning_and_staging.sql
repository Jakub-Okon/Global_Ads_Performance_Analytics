-- Creating duplicate for EDA and Data Cleaning
CREATE TABLE ads_staging LIKE global_ads_performance;
INSERT INTO ads_staging SELECT * FROM global_ads_performance;

-- Converting date type from text to data
ALTER TABLE ads_staging MODIFY COLUMN date DATE;

-- Trimming eventual typos for standarization and aggregation purposes
UPDATE ads_staging
	SET platform = TRIM(platform),
		industry = TRIM(industry),
        country = TRIM(country);