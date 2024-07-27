-- Databricks notebook source
select * from sales

-- COMMAND ----------

select min(date), max(date) from sales

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from datetime import date, timedelta,datetime 
-- MAGIC
-- MAGIC dbutils.widgets.dropdown("time_period","weekly",['monthly','weekly','daily'])
-- MAGIC time_period=dbutils.widgets.get("time_period")
-- MAGIC
-- MAGIC today= date.today()
-- MAGIC
-- MAGIC if time_period=='weekly':
-- MAGIC     start_date = today-timedelta(days=today.weekday(),weeks=1)-timedelta(days=1)
-- MAGIC     end_date = start_date+timedelta(days=6)
-- MAGIC
-- MAGIC elif time_period=='monthly':
-- MAGIC      first = today.replace(day=1)
-- MAGIC      end_date = first-timedelta(days=1)
-- MAGIC      start_date = first-timedelta(days=end_date.day)
-- MAGIC else:
-- MAGIC     start_date=today-timedelta(days=1)
-- MAGIC     end_date=start_date
-- MAGIC
-- MAGIC display(spark.sql(f""" select sum(sale),city from sales where date between '{start_date}' and '{end_date}' group by city """))
-- MAGIC
-- MAGIC
-- MAGIC print(start_date,end_date)

-- COMMAND ----------

select sum(sale) from sales

-- COMMAND ----------


