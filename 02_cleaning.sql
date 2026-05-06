-- =====================================
-- 02_cleaning.sql
-- Limpieza y transformación de datos
-- =====================================

-- Creación de tabla limpia
CREATE TABLE amazon_clean (
    product_id NVARCHAR(100),
    product_name NVARCHAR(MAX),
    category NVARCHAR(255),
    actual_price FLOAT,
    discounted_price FLOAT,
    discount_percentage FLOAT,
    rating FLOAT,
    rating_count INT,
    user_id NVARCHAR(MAX),
    user_name NVARCHAR(MAX),
    review_id NVARCHAR(MAX),
    review_title NVARCHAR(MAX),
    review_content NVARCHAR(MAX)
);

-- Insertar datos limpios
INSERT INTO amazon_clean
SELECT
    product_id,
    product_name,
    category,

     -- limpiar precio real
    TRY_CAST(
        REPLACE(
            REPLACE(actual_price, N'₹', ''), 
        ',', '') 
    AS DECIMAL(18,2)),

    -- limpiar precio con descuento
    TRY_CAST(
        REPLACE(
            REPLACE(discounted_price, N'₹', ''), 
        ',', '') 
    AS DECIMAL(18,2)),

    -- limpiar porcentaje
    TRY_CAST(REPLACE(discount_percentage, '%', '') AS FLOAT),

    -- rating
    TRY_CAST(rating AS FLOAT),

    -- cantidad de ratings
    TRY_CAST(
		REPLACE(
			REPLACE(
				REPLACE(rating_count, 'ratings', ''),
			',', ''),
		' ', '')
	AS INT),

    user_id,
    user_name,
    review_id,
    review_title,
    review_content

FROM amazon_raw;

-- Validación
SELECT TOP 10 * FROM amazon_clean;
