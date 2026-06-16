CREATE TABLE IF NOT EXISTS dim_products (
    sku_id VARCHAR PRIMARY KEY,
    category VARCHAR
);

CREATE TABLE IF NOT EXISTS fact_weekly_sales (
    week_id INT,
    sku_id VARCHAR REFERENCES dim_products(sku_id),
    price NUMERIC,
    units_sold INT,
    sales_velocity NUMERIC,
    inventory_age_days INT
);

CREATE TABLE IF NOT EXISTS fact_markdown_recommendations (
    sku_id VARCHAR REFERENCES dim_products(sku_id),
    elasticity_score NUMERIC,
    current_price NUMERIC,
    recommended_price NUMERIC,
    discount_pct NUMERIC,
    projected_units_sold INT,
    projected_revenue NUMERIC,
    projected_margin_lift_pct NUMERIC,
    urgency_flag VARCHAR
);