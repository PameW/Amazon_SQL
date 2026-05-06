# 🛒 Amazon Product Analysis | SQL + Python Project

---

## 📌 🇺🇸 Overview

This project focuses on transforming and analyzing a raw Amazon e-commerce dataset using SQL Server and Python.

The dataset initially contained multiple real-world data issues, such as inconsistent formats, multi-value fields, and conversion errors that resulted in missing values in key variables like prices and ratings.

A major challenge identified during the process was the incorrect transformation of price-related columns due to special characters and invisible spaces, which caused data loss during type conversion. This issue was solved by implementing a robust cleaning strategy, allowing the recovery of critical numerical data.

The cleaned dataset was then normalized into relational tables and analyzed to extract meaningful business insights.

---

## 📌 🇪🇸 Descripción general

Este proyecto se enfoca en la transformación y análisis de un dataset de e-commerce de Amazon utilizando SQL Server y Python.

El dataset presentaba múltiples problemas típicos de datos reales, como formatos inconsistentes, campos con múltiples valores y errores de conversión que generaban valores nulos en variables clave como precios y ratings.

Uno de los principales desafíos fue la pérdida de datos en columnas de precios debido a caracteres especiales y espacios invisibles, lo que impedía su correcta conversión. Este problema fue resuelto mediante una estrategia de limpieza robusta, permitiendo recuperar información crítica.

Posteriormente, el dataset fue normalizado y analizado para extraer insights de negocio.

---

## 🎯 Objectives | Objetivos

### 🇺🇸

* Detect and fix data transformation issues
* Clean and standardize inconsistent fields
* Convert textual data into numeric formats
* Normalize dataset into relational tables
* Analyze pricing, discounts, and ratings
* Identify user behavior patterns
* Generate visual insights using Python

### 🇪🇸

* Detectar y corregir errores en la transformación de datos
* Limpiar y estandarizar campos inconsistentes
* Convertir datos textuales a formatos numéricos
* Normalizar el dataset en tablas relacionales
* Analizar precios, descuentos y ratings
* Identificar patrones de comportamiento de usuarios
* Generar visualizaciones con Python

---

## 🧹 Data Cleaning | Limpieza de datos

### 🇺🇸

* Removed currency symbols and formatting (`₹`, commas)
* Handled invisible characters (`CHAR(160)`)
* Fixed conversion issues using `TRY_CAST`
* Recovered missing values caused by transformation errors

### 🇪🇸

* Eliminación de símbolos de moneda (`₹`) y separadores
* Manejo de caracteres invisibles (`CHAR(160)`)
* Corrección de conversiones con `TRY_CAST`
* Recuperación de valores perdidos por errores de transformación

---

## 🧠 Data Modeling | Modelado de datos

The dataset was normalized into:

* **products**
* **users**
* **reviews**

### Techniques used:

* `STRING_SPLIT()` for multi-value fields
* `ROW_NUMBER()` to align related values
* Aggregations to resolve duplicates

---

## 📊 Analysis | Análisis

### Key insights | Principales insights:

* Price is not directly correlated with rating
* Discounts do not guarantee better product reviews
* A small group of users generates a large number of reviews
* Data quality strongly impacts analytical outcomes

---

## 🛠️ Tools | Herramientas

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* Python (Pandas, Matplotlib)
* Jupyter Notebook

---

## 🚀 Future Improvements | Mejoras futuras

* Build interactive dashboards (Streamlit)
* Apply statistical analysis and modeling
* Improve data pipeline automation
* Expand dataset for deeper analysis

---

## 💡 Key Learnings | Aprendizajes clave

### 🇺🇸

* Real-world data requires extensive cleaning
* Data transformation errors can lead to critical data loss
* Data modeling is essential for scalable analysis
* Combining SQL and Python enhances analytical capabilities

### 🇪🇸

* Los datos reales requieren procesos intensivos de limpieza
* Los errores de transformación pueden generar pérdida de información
* El modelado de datos es clave para análisis escalables
* La combinación de SQL y Python potencia el análisis

---
