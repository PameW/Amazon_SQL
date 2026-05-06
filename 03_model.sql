-- =====================================
-- 03_model.sql
-- Normalización y modelado relacional
-- =====================================

-- =====================
-- Tabla PRODUCTS
-- =====================

CREATE TABLE products (
    product_id NVARCHAR(100) PRIMARY KEY,
    product_name NVARCHAR(MAX),
    category NVARCHAR(255),
    actual_price FLOAT,
    discounted_price FLOAT,
    discount_percentage FLOAT,
    rating FLOAT,
    rating_count INT
);

-- Inserción de productos
WITH ranked_products AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY product_id 
            ORDER BY rating_count DESC
        ) as rn
    FROM amazon_clean
)

INSERT INTO products
SELECT
    product_id,
    product_name,
    category,
    actual_price,
    discounted_price,
    discount_percentage,
    rating,
    rating_count
FROM ranked_products
WHERE rn = 1;


-- =====================
-- Tabla USERS
-- =====================

CREATE TABLE users (
    user_id NVARCHAR(100) PRIMARY KEY,
    user_name NVARCHAR(MAX)
);

-- Inserción de usuarios
INSERT INTO users (user_id, user_name)
SELECT 
    user_id,
    MAX(user_name) as user_name
FROM (
    SELECT 
        ui.user_id,
        un.user_name
    FROM (
        SELECT 
            product_id,
            value AS user_id,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY (SELECT NULL)) AS rn
        FROM amazon_clean
        CROSS APPLY STRING_SPLIT(user_id, ',')
    ) ui
    JOIN (
        SELECT 
            product_id,
            value AS user_name,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY (SELECT NULL)) AS rn
        FROM amazon_clean
        CROSS APPLY STRING_SPLIT(user_name, ',')
    ) un
    ON ui.product_id = un.product_id
    AND ui.rn = un.rn
) t
GROUP BY user_id;

-- =====================
-- Tabla REVIEWS
-- =====================

CREATE TABLE reviews (
    review_id NVARCHAR(100),
    product_id NVARCHAR(100),
    user_id NVARCHAR(100),
    review_title NVARCHAR(MAX),
    review_content NVARCHAR(MAX)
);

-- Inserción de reviews
WITH review_ids AS (
    SELECT 
        product_id,
        value AS review_id,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY (SELECT NULL)) AS rn
    FROM amazon_clean
    CROSS APPLY STRING_SPLIT(review_id, ',')
),
user_ids AS (
    SELECT 
        product_id,
        value AS user_id,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY (SELECT NULL)) AS rn
    FROM amazon_clean
    CROSS APPLY STRING_SPLIT(user_id, ',')
)

INSERT INTO reviews
SELECT DISTINCT
    r.review_id,
    r.product_id,
    u.user_id,
    ac.review_title,
    ac.review_content
FROM review_ids r
JOIN user_ids u
    ON r.product_id = u.product_id
    AND r.rn = u.rn
JOIN amazon_clean ac
    ON ac.product_id = r.product_id;

-- =====================
-- Validación
-- =====================

SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM reviews;
SELECT COUNT(DISTINCT review_id) FROM reviews;

SELECT TOP 10 * FROM products;
SELECT TOP 10 * FROM users;
SELECT TOP 10 * FROM reviews;