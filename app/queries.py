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
