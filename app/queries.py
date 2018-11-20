import MySQLdb as mysql


class Queries:

    def __init__(self, host, user, passwd, db_name):
        self.db = mysql.connect(host=host, user=user,
                                passwd=passwd, db=db_name)

    def query_1(self):
        cursor = self.db.cursor()
        cursor.execute("""SELECT registration_number FROM Car""")
        return cursor.fetchall()

    