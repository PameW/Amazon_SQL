-- =====================================
-- 04_analysis.sql
-- Análisis exploratorio
-- =====================================

--1. Top productos mejor valorados
SELECT TOP 10
    product_name,
    rating,
    rating_count
FROM products
WHERE rating IS NOT NULL
ORDER BY rating DESC, rating_count DESC;

--2. Productos con mayor descuento
SELECT TOP 10
    product_name,
    actual_price,
    discounted_price,
    discount_percentage
FROM products
ORDER BY discount_percentage DESC;

--3. Más descuento = Mejor rating?
SELECT 
    CASE 
        WHEN discount_percentage < 20 THEN 'Bajo'
        WHEN discount_percentage < 50 THEN 'Medio'
        ELSE 'Alto'
    END AS rango_descuento,
    AVG(rating) AS avg_rating,
    COUNT(*) AS cantidad_productos
FROM products
GROUP BY 
    CASE 
        WHEN discount_percentage < 20 THEN 'Bajo'
        WHEN discount_percentage < 50 THEN 'Medio'
        ELSE 'Alto'
    END
ORDER BY avg_rating DESC;

--4. Productos más populares
SELECT TOP 10
    product_name,
    rating_count
FROM products
ORDER BY rating_count DESC;

--5. Usuarios más activos
SELECT TOP 10
    user_id,
    COUNT(*) AS cantidad_reviews
FROM reviews
GROUP BY user_id
ORDER BY cantidad_reviews DESC;

--6. Productos con más reviews
SELECT TOP 10
    p.product_name,
    COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN products p ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_reviews DESC;

--7. Relación precio vs rating
SELECT 
    CASE 
        WHEN actual_price < 1000 THEN 'Barato'
        WHEN actual_price < 5000 THEN 'Medio'
        ELSE 'Caro'
    END AS rango_precio,
    AVG(rating) AS avg_rating
FROM products
GROUP BY 
    CASE 
        WHEN actual_price < 1000 THEN 'Barato'
        WHEN actual_price < 5000 THEN 'Medio'
        ELSE 'Caro'
    END;

--8. Productos con mejor "valor"
SELECT TOP 10
    product_name,
    rating,
    discount_percentage,
    (rating * discount_percentage) AS score_valor
FROM products
WHERE rating IS NOT NULL AND discount_percentage IS NOT NULL
ORDER BY score_valor DESC;

--9. Ranking
SELECT
    product_name,
    rating,
    RANK() OVER (ORDER BY rating DESC) as ranking
FROM products;
    