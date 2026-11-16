-- platform profitability calculations
-- tiktok with highest ROAS and lowest CPA 
SELECT
	platform,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend) / SUM(conversions), 2) AS real_CPA,
	ROUND(SUM(revenue) / SUM(ad_spend), 2) AS real_ROAS
    FROM ads_staging
GROUP BY platform
ORDER BY real_ROAS DESC;

-- drill down on individual industries (tiktok ads)
-- e-commerce with highest ROAS and second best CPA
SELECT
	INDUSTRY,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend) / SUM(conversions), 2) AS real_CPA,
	ROUND(SUM(revenue) / SUM(ad_spend), 2) AS real_ROAS
    FROM ads_staging
WHERE platform LIKE "TikTok Ads"
GROUP BY industry
ORDER BY real_ROAS DESC;

-- analysing most profitable campaign type (tiktok e-commerce)
-- most proftable are search campaigns getting 10.7 ROAS while having second best CPA
SELECT
	campaign_type,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend) / SUM(conversions), 2) AS real_CPA,
	ROUND(SUM(revenue) / SUM(ad_spend), 2) AS real_ROAS
    FROM ads_staging
WHERE platform LIKE "TikTok Ads" AND industry LIKE "E-commerce"
GROUP BY campaign_type
ORDER BY real_ROAS DESC;

-- analysing per month (tiktok e-commerce)
-- November generated highest ROAS and lowest CPA 
SELECT
	DATE_FORMAT(date, '%Y-%m') AS month,
    ROUND(SUM(ad_spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(ad_spend) / SUM(conversions), 2) AS real_CPA,
	ROUND(SUM(revenue) / SUM(ad_spend), 2) AS real_ROAS
    FROM ads_staging
WHERE platform LIKE "TikTok Ads" AND industry LIKE "E-commerce"
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;
