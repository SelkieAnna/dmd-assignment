import _mysql as mysql


class Queries:

    def __init__(self, host, user, passwd, db_name):
        self.db = mysql.connect(host=host, user=user,
                                passwd=passwd, db=db_name)



    def query_1(self):
        self.db.query("""SELECT registration_number FROM Car""")
        r = self.db.store_result()
        print(r.fetchall())
        print(r.fetch_row()[0])
        r = list(r.fetch_row()[0])
        for i in range(len(r)):
            r[i] = r[i].decode()


        return r
