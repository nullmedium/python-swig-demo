
import demo

class Test:
    def __init__(self):
        self.d = demo.Demo()

        # callback = 
        self.d.registerFunc(self.testFunc)

    def testFunc(self,value):
        print("{}".format(value))
        return True

    def test(self):
        self.d.execute()
    

if __name__ == "__main__":
    t = Test()
    t.test()
