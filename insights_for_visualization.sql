--MENCARI TOTAL TES YANG DILAKUKAN
WITH tabel_a AS (
  SELECT 
    country_name, 
    max(cumulative_tested) AS totaltes 
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY 
    country_name
  ) 
SELECT 
  sum(tabel_a.totaltes) AS Cumulative_Tested 
  from 
    tabel_a;

--MENCARI TOTAL KASUS DI SELURUH DUNIA
WITH tabel_a AS (
  SELECT 
    country_name, 
    max(cumulative_confirmed) AS totalkasus 
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY 
  country_name
  ) 
SELECT 
  sum(tabel_a.totalkasus) AS Cumulative_Cases 
from 
  tabel_a;

--MENCARI TOTAL YANG SEMBUH
WITH tabel_a AS (
  SELECT 
    country_name, 
    max(cumulative_recovered) AS totalsembuh 
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY 
    country_name
  ) 
SELECT 
  sum(tabel_a.totalsembuh) AS Cumulative_Recovered 
from 
  tabel_a;

--MENCARI TOTAL YANG MENINGGAL
WITH tabel_a AS (
  SELECT 
    country_name, 
    max(cumulative_deceased) AS totalkematian 
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY 
    country_name
  ) 
SELECT 
  sum(tabel_a.totalkematian) AS Cumulative_Death 
from 
  tabel_a;

--MENCARI TIME SERIES TOTAL KASUS DI DUNIA
WITH tabel_a AS (
  SELECT 
    date, 
    country_name, 
    max(cumulative_confirmed) AS totalkasus 
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY 
    country_name, date
  ) 
SELECT 
  date, 
  sum(tabel_a.totalkasus) AS Cumulative_Cases 
from 
  tabel_a 
GROUP BY 
  date 
ORDER BY 
  date DESC;

--MENCARI TIME SERIES TOTAL KEMATIAN DI DUNIA
WITH tabel_a AS (
  SELECT 
    date, 
    country_name, 
    max(cumulative_deceased) AS totalkematian 
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY 
    country_name, date
  ) 
SELECT 
  date, 
  sum(tabel_a.totalkematian) AS Cumulative_Death 
from 
  tabel_a 
GROUP BY 
  date 
ORDER BY 
  date DESC;

--MENCARI DIAGRAM DONAT PERSEBARAN KASUS DI BERBAGAI NEGARA
SELECT 
  country_name, 
  max(date) AS date, 
  max(cumulative_confirmed) AS Cumulative_Cases 
FROM 
  `bigquery-public-data.covid19_open_data.covid19_open_data`
GROUP BY 1 ORDER BY 3 DESC;

--MENCARI PERSEBARAN KASUS DI BERBAGAI DUNIA BERDASARKAN RENTANG TANGGAL
SELECT 
  * 
FROM 
  `bigquery-public-data.covid19_open_data.covid19_open_data` ;

--MENCARI PERSEBARAN KASUS COVID DUNIA BERDASARKAN JENIS KELAMIN
WITH tabel_a AS (
  SELECT 
    country_name, 
    max(cumulative_confirmed_male) AS totalcowo, 
    max(cumulative_confirmed_female) AS totalcewe  
  FROM 
    `bigquery-public-data.covid19_open_data.covid19_open_data` 
  GROUP BY
    country_name 
  ) 
SELECT 
  sum(tabel_a.totalcowo) AS JumlahKasusCowo, 
  sum(tabel_a.totalcewe) AS JumlahKasusCewe 
from 
  tabel_a;

--MENCARI PERSEBARAN KASUS COVID BERBAGAI NEGARA BERDASARKAN JENIS KELAMIN
SELECT 
  * 
FROM 
  `bigquery-public-data.covid19_open_data.covid19_open_data` ; /* masukkan metrik cumulative_confirmed_male dan cumulative_confirmed_female */ 

--MENCARI JUMLAH SEKOLAH TUTUP, TEMPAT KERJA TUTUP, DAN ACARA PUBLIK BATAL
SELECT 
  SUM(workplace_closing) AS kerjatutup, 
  SUM(school_closing) AS sekolahtutup, 
  SUM(cancel_public_events) AS acarabatal
FROM 
  `bigquery-public-data.covid19_open_data.covid19_open_data`;
