-- =====================================
-- 01_import.sql
-- Importación de datos crudos
-- =====================================

-- Dataset: amazon_raw
-- Fuente: https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset
-- Método: SQL Server Import Wizard
-- Todas las columnas importadas como NVARCHAR(MAX)
-- Motivo: evitar errores de conversión y pérdida de datos

SELECT TOP 10 * FROM amazon_raw;