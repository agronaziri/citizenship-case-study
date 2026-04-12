SELECT *
FROM citizenship;

SELECT COUNT(*) AS total_rows
FROM citizenship;

SELECT DISTINCT "Phase"
FROM citizenship;

SELECT DISTINCT "Category"
FROM citizenship;

SELECT
    SUM("Time (days)") AS total_time_days,
    SUM("Cost (€)") AS total_cost_eur,
    AVG("Difficulty (1–5)") AS avg_difficulty
FROM citizenship;

SELECT
    "Category",
    SUM("Time (days)") AS total_time_days
FROM citizenship
GROUP BY "Category"
ORDER BY total_time_days DESC;

SELECT
    "Category",
    SUM("Cost (€)") AS total_cost_eur
FROM citizenship
GROUP BY "Category"
ORDER BY total_cost_eur DESC;

SELECT
    "Category",
    AVG("Difficulty (1–5)") AS avg_difficulty
FROM citizenship
GROUP BY "Category"
ORDER BY avg_difficulty DESC;

SELECT
    "Phase",
    SUM("Time (days)") AS total_time_days
FROM citizenship
GROUP BY "Phase"
ORDER BY total_time_days DESC;

SELECT
    "Step Description",
    "Time (days)"
FROM citizenship
ORDER BY "Time (days)" DESC;

SELECT
    "Step Description",
    "Cost (€)"
FROM citizenship
ORDER BY "Cost (€)" DESC;

SELECT
    "Step Description",
    "Difficulty (1–5)"
FROM citizenship
ORDER BY "Difficulty (1–5)" DESC, "Time (days)" DESC;

CREATE TABLE category_summary AS
SELECT
    "Category" AS category,
    SUM("Time (days)") AS total_time_days,
    SUM("Cost (€)") AS total_cost_eur,
    AVG("Difficulty (1–5)") AS avg_difficulty
FROM citizenship
GROUP BY "Category";

SELECT *
FROM category_summary
ORDER BY total_time_days DESC;

CREATE TABLE phase_summary AS
SELECT
    "Phase" AS phase,
    SUM("Time (days)") AS total_time_days,
    SUM("Cost (€)") AS total_cost_eur,
    AVG("Difficulty (1–5)") AS avg_difficulty
FROM citizenship
GROUP BY "Phase";

SELECT *
FROM phase_summary
ORDER BY total_time_days DESC;
