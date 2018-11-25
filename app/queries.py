import MySQLdb as mysql


class Queries:

    def __init__(self, host, user, passwd, db_name):
        self.db = mysql.connect(host=host, user=user,
                                passwd=passwd, db=db_name)

    # в этом quary есть проблема
    # объясняю как работает:
    # на всякие курсоры можно забить и принять как должное
    # На сайте с гайдом написано, что чтобы использовать переменные в запросах, нужно ставить %s
    # и после самого запроса дать tuple со всеми нужными значениями в порядке применения (как в си)
    # Но если ему скормить то, что я написал, оно скажет not enough arguments
    # Я уже понял в чем шняга: в куске "LIKE "AN%"" он читает % как форматовый символ и поэтому ждет
    # второго аргумента в тупле. Если туда засунуть например пустую строку, он опять же выдаст ошибку,
    # только теперь уже "unsupported format character ''' ". Дело в том, что метод ожидает, что после процента
    # будет например s (чтобы стало %s), но не получает его. Поэтому и выдает такую ошибку.
    # проблема есть, решения нет. Придумайте плес
    # если такая херня будет нам мешать, придется выбрать другую либу для SQL, а то это не дело
    def query_1(self, customer_id):
        cursor = self.db.cursor()
        cursor.execute("""
        SELECT * FROM Car WHERE 
                registration_number=
                (SELECT car_id FROM Car_order WHERE 
                        customer_id=%s AND 
                        car_id LIKE 'AN%')
                AND color='red'""", (str(customer_id), ""))
        return cursor.fetchall()

    def query_2(self, station_id, date):
        cursor = self.db.cursor()
        sql_query = "SELECT * FROM Available_time WHERE station_id = %s AND date = %s"
        cursor.execute(sql_query, (str(station_id), date))
        records = cursor.fetchall()
        cursor.close()
        return records[0][2:]

    def query_3(self):
        cursor = self.db.cursor()
        morning = """SELECT COUNT(car_id) FROM
                        (SELECT DISTINCT car_id FROM Car_order
                        WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '7:00:00' AND
                              DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '10:00:00)'"""
        afternoon = """SELECT COUNT(car_id) FROM
                        (SELECT DISTINCT car_id FROM Car_order
                        WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '12:00:00' AND
                              DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '14:00:00)'"""
        evening = """SELECT COUNT(car_id) FROM
                        (SELECT DISTINCT car_id FROM Car_order
                        WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '17:00:00' AND
                              DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '19:00:00)'"""
        cursor.execute(morning)
        cursor.execute(afternoon)
        cursor.execute(evening)
        result = cursor.fetchall()
        cursor.close()
        return result

    def query_4(self, customer_id):
        cursor = self.db.cursor()
        sql_query = "SELECT A.* FROM Car_order A " \
                    "INNER JOIN (SELECT date_time " \
                                "FROM Car_order " \
                                "GROUP BY date_time " \
                                "HAVING COUNT(*) > 1) B " \
                    "ON A.customer_id = %s AND A.date_time = B.date_time " \
                    "WHERE (YEAR(A.date_time) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) " \
                    "AND MONTH(A.date_time) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)) OR " \
                    "(YEAR(A.date_time) = YEAR(CURRENT_DATE)" \
                    "AND MONTH(A.date_time) = MONTH(CURRENT_DATE))"
        cursor.execute(sql_query, customer_id)
        records = cursor.fetchall()
        cursor.close()
        if len(records) == 0:
            return False
        else:
            return True

    def query_5(self, day):
        cursor = self.db.cursor()
        sql_query = "SELECT AVG(distance_to_customer) FROM Car_order " \
                    "WHERE YEAR(date_time) = YEAR(%s) " \
                                "AND MONTH(date_time) = MONTH(%s)" \
                                "AND DAY(date_time) = DAY(%s) UNION ALL " \
                    "SELECT AVG(trip_duration) FROM Car_order " \
                        "WHERE YEAR(date_time) = YEAR(%s) " \
                        "AND MONTH(date_time) = MONTH(%s)" \
                        "AND DAY(date_time) = DAY(%s)"



        cursor.execute(sql_query, (day, day, day, day, day, day,))
        records = cursor.fetchall()
        record1 = records[0][0]
        record2 = records[1][0]
        cursor.close()
        return record1, record2

    # top-3 not done yet
    # maybe include some interactivity:
    # point a/point b, time period, number (top-3/top-10/...)
    def query_6(self):
        cursor = self.db.cursor()
        morning_a = """SELECT point_a, COUNT(*) FROM
                            (SELECT point_a FROM Car_order
                            WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '7:00:00' AND
                                  DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '10:00:00')      
                        GROUP BY point_a
                        ORDER BY COUNT(*)"""
        morning_b = """SELECT point_b, COUNT(*) FROM
                            (SELECT point_b FROM Car_order
                            WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '7:00:00' AND
                                  DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '10:00:00')      
                        GROUP BY point_b
                        ORDER BY COUNT(*)"""
        afternoon_a = """SELECT point_a, COUNT(*) FROM
                            (SELECT point_a FROM Car_order
                            WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '12:00:00' AND
                                  DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '14:00:00')      
                        GROUP BY point_a
                        ORDER BY COUNT(*)"""
        afternoon_b = """SELECT point_b, COUNT(*) FROM
                            (SELECT point_b FROM Car_order
                            WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '12:00:00' AND
                                  DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '14:00:00')      
                        GROUP BY point_b
                        ORDER BY COUNT(*)"""
        evening_a = """SELECT point_a, COUNT(*) FROM
                            (SELECT point_a FROM Car_order
                            WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '17:00:00' AND
                                  DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '19:00:00')      
                        GROUP BY point_a
                        ORDER BY COUNT(*)"""
        evening_b = """SELECT point_b, COUNT(*) FROM
                            (SELECT point_b FROM Car_order
                            WHERE DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) > '17:00:00' AND
                                  DATEADD(day, -DATEDIFF(day, 0, date_time), date_time) < '19:00:00')      
                        GROUP BY point_b
                        ORDER BY COUNT(*)"""
        cursor.execute(morning_a)
        cursor.execute(morning_b)
        cursor.execute(afternoon_a)
        cursor.execute(afternoon_b)
        cursor.execute(evening_a)
        cursor.execute(evening_a)
        result = cursor.fetchall()
        cursor.close()
        return result
