import MySQLdb as Mysql


class Queries:

    def __init__(self, host, user, passwd, db_name):
        self.db = Mysql.connect(host=host, user=user,
                                passwd=passwd, db=db_name)

    def query_1(self, customer_id, registration_number_start, color):
        cursor = self.db.cursor()
        query = """
                    SELECT * FROM Car WHERE 
                        registration_number in (SELECT car_id FROM Car_order WHERE 
                                                customer_id=%s AND 
                                                car_id LIKE %s)
                    AND color = %s
                """
        regexp = str(registration_number_start) + '%'
        cursor.execute(query, (str(customer_id), regexp, str(color)))
        return cursor.fetchall()

    def query_2(self, station_id, date):
        cursor = self.db.cursor()
        sql_query = """
                        SELECT * FROM Station_time WHERE station_id = %s AND date = %s
                    """
        cursor.execute(sql_query, (str(station_id), date))
        records = cursor.fetchall()
        cursor.close()
        return records[0][2:]

    # might be wrong w.r.t duration
    def query_3(self, begin_date, end_date):
        cursor = self.db.cursor()
        result = []
        morning = """
                      SELECT COUNT(car_id) FROM
                        (SELECT DISTINCT car_id FROM Car_order
                        WHERE TIME(date_time) >= '7:00:00' AND
                              TIME(date_time) <= '10:00:00' AND
                              DATE(date_time) >= %s AND
                              DATE(date_time) <= %s) AS Morning_cars"""
        afternoon = """SELECT COUNT(car_id) FROM
                        (SELECT DISTINCT car_id FROM Car_order
                        WHERE TIME(date_time) >= '12:00:00' AND
                              TIME(date_time) <= '14:00:00' AND
                              DATE(date_time) >= %s AND
                              DATE(date_time) <= %s) AS Afternoon_cars"""
        evening = """SELECT COUNT(car_id) FROM
                        (SELECT DISTINCT car_id FROM Car_order
                        WHERE TIME(date_time) >= '17:00:00' AND
                              TIME(date_time) <= '19:00:00' AND
                              DATE(date_time) >= %s AND
                              DATE(date_time) <= %s) AS Evening_Cars"""
        cursor.execute(morning, (begin_date, end_date))
        result.append(cursor.fetchall()[0][0])
        cursor.execute(afternoon, (begin_date, end_date))
        result.append(cursor.fetchall()[0][0])
        cursor.execute(evening, (begin_date, end_date))
        result.append(cursor.fetchall()[0][0])
        cursor.close()
        return result

    def query_4(self, customer_id):
        cursor = self.db.cursor()
        sql_query = """
                    SELECT A.* FROM Car_order A
                    INNER JOIN (SELECT date_time
                                FROM Car_order
                                GROUP BY date_time
                                HAVING COUNT(*) > 1) B
                    ON A.customer_id = %s AND A.date_time = B.date_time
                    WHERE (YEAR(A.date_time) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
                    AND MONTH(A.date_time) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)) OR
                    (YEAR(A.date_time) = YEAR(CURRENT_DATE)
                    AND MONTH(A.date_time) = MONTH(CURRENT_DATE))
                    """
        cursor.execute(sql_query, customer_id)
        records = cursor.fetchall()
        cursor.close()
        if len(records) == 0:
            return False
        else:
            return True

    def query_5(self, day):
        cursor = self.db.cursor()
        sql_query = """
                    SELECT AVG(distance) FROM Car_order
                    WHERE YEAR(date_time) = YEAR(%s)
                                AND MONTH(date_time) = MONTH(%s)
                                AND DAY(date_time) = DAY(%s) UNION ALL
                    SELECT AVG(trip_duration) FROM Car_order
                        WHERE YEAR(date_time) = YEAR(%s)
                        AND MONTH(date_time) = MONTH(%s)
                        AND DAY(date_time) = DAY(%s)
                    """

        cursor.execute(sql_query, (day, day, day, day, day, day,))
        records = cursor.fetchall()
        record1 = records[0][0]
        record2 = records[1][0]
        cursor.close()
        return record1, record2

    # might be wrong w.r.t duration
    def query_6(self, top_n):
        cursor = self.db.cursor()
        result = []
        morning_a = """SELECT point_a, COUNT(*) FROM
                            (SELECT point_a FROM Car_order
                            WHERE TIME(date_time) > '7:00:00' AND
                                  TIME(date_time) < '10:00:00') AS Morning_picks     
                        GROUP BY point_a
                        ORDER BY -COUNT(*)
                        LIMIT %s"""
        morning_b = """SELECT point_b, COUNT(*) FROM
                            (SELECT point_b FROM Car_order
                            WHERE TIME(date_time) > '7:00:00' AND
                                  TIME(date_time) < '10:00:00') AS Morning_dests     
                        GROUP BY point_b
                        ORDER BY -COUNT(*)
                        LIMIT %s"""
        afternoon_a = """SELECT point_a, COUNT(*) FROM
                            (SELECT point_a FROM Car_order
                            WHERE TIME(date_time) > '12:00:00' AND
                                  TIME(date_time) < '14:00:00') AS Afternoon_picks    
                        GROUP BY point_a
                        ORDER BY -COUNT(*)
                        LIMIT %s"""
        afternoon_b = """SELECT point_b, COUNT(*) FROM
                            (SELECT point_b FROM Car_order
                            WHERE TIME(date_time) > '12:00:00' AND
                                  TIME(date_time) < '14:00:00') AS Afternoon_dests
                        GROUP BY point_b
                        ORDER BY -COUNT(*)
                        LIMIT %s"""
        evening_a = """SELECT point_a, COUNT(*) FROM
                            (SELECT point_a FROM Car_order
                            WHERE TIME(date_time) > '17:00:00' AND
                                  TIME(date_time) < '19:00:00') AS Evening_picks 
                        GROUP BY point_a
                        ORDER BY -COUNT(*)
                        LIMIT %s"""
        evening_b = """SELECT point_b, COUNT(*) FROM
                            (SELECT point_b FROM Car_order
                            WHERE TIME(date_time) > '17:00:00' AND
                                  TIME(date_time) < '19:00:00') AS Evening_dests  
                        GROUP BY point_b
                        ORDER BY -COUNT(*)
                        LIMIT %s"""
        cursor.execute(morning_a, [top_n])
        result.append(cursor.fetchall())
        cursor.execute(morning_b, [top_n])
        result.append(cursor.fetchall())
        cursor.execute(afternoon_a, [top_n])
        result.append(cursor.fetchall())
        cursor.execute(afternoon_b, [top_n])
        result.append(cursor.fetchall())
        cursor.execute(evening_a, [top_n])
        result.append(cursor.fetchall())
        cursor.execute(evening_a, [top_n])
        result.append(cursor.fetchall())
        cursor.close()
        return result

    def query_7(self, begin_date, end_date, percentage):
        cursor = self.db.cursor()
        amount_query = """SELECT COUNT(*) FROM Car"""
        cursor.execute(amount_query)
        amount = cursor.fetchone()[0]
        sql = """SELECT car_id, COUNT(*) FROM 
                        (SELECT car_id from Car_order
                        WHERE DATE(date_time) >= %s AND
                              DATE(date_time) <= %s) AS Orders
                    GROUP BY car_id
                    ORDER BY COUNT(*)
                    LIMIT %s"""
        cursor.execute(sql, [begin_date, end_date, amount * percentage])
        result = cursor.fetchall()
        cursor.close()
        return result

    def query_8(self, date):
        cursor = self.db.cursor()
        sql = """SELECT customer_id, COUNT(customer_id) FROM Car_order A 
                    INNER JOIN (SELECT time_date 
                                FROM Socket_car 
                                GROUP BY time_date) B 
                    ON date(B.time_date) = date(A.date_time) AND date(B.time_date) >= %s
                 GROUP BY customer_id
                """
        cursor.execute(sql, (date,))
        result = cursor.fetchall()
        cursor.close()
        return result  #first value is user_id. second value is amount

    def query_9(self):
        cursor = self.db.cursor()
        sql = """ SELECT part_id, COUNT(part_id), A.workshop_id FROM Part_order A
                    INNER JOIN (SELECT workshop_id, COUNT(workshop_id) AS number 
                                FROM Part_order 
                                GROUP BY workshop_id
                                ) B
                    WHERE A.workshop_id = B.workshop_id 
                    GROUP BY part_id
        """
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        return result