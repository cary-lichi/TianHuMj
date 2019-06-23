#-*-coding:utf-8
import tornado.web
import tornado.httpserver
import tornado.options
import tornado.ioloop
import tornado.log
import yaml
import logging
import logging.config

from configs import config_game
from application import webapplication
from tornado.options import define, options
from dal.dal_admin import Dal_Admin
from dal.dal_delegate import Dal_Delegate
from dal.dal_mail import Dal_Mail
from dal.dal_user import Dal_User
from dal.dal_record import Dal_Record
from dal.dal_recharge import Dal_Recharge
from dal.dal_operate import Dal_Operate
from logic.mianTimerMamager import MainTimerManager
from tools.utils import Utils
from logic.ACMJ import ACMJ

#coding=utf-8
define("port", default=8001, help="run on the given port", type=int)

def initLog():
    #logging.config.fileConfig('configs/logging.conf')
    logging.config.dictConfig(yaml.load(open('configs/python_logging.yaml', 'r')))

def onHttpTest(data):
    n = 0

def httpTest():
    Utils().send_post_request("127.0.0.1",8001,'/index',{'test':1},onHttpTest)

def initCache():
    Dal_User().initCache()

    # for k in range(1,100):
    #     rd = Record()
    #     rd.time = Utils().dbTimeCreate()
    #     rd.gameplay=''
    #     k = str(k)
    #     rd.gamers = "101786:"+k+"-"+k+";"+"101787:"+k+"-"+k+";"+"101788:"+k+"-"+k+";"+"101789:"+k+"-"+k
    #     Dal_Record().addRecord(rd)
    Dal_Record().initCache()
    Dal_Delegate().initCache()
    Dal_Mail().initCache()
    Dal_Admin().initCache()
    Dal_Recharge().initCache()
    Dal_Operate().initCache()

def main():
    print (options.help)
    print "Quit the server with CONTROL-C "
    tornado.options.parse_command_line()
    http_server=tornado.httpserver.HTTPServer(webapplication)
    http_server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()

def test():
    mj=ACMJ()

    # arr = [101, 101, 102, 102, 103, 103, 104, 104, 105, 105, 106, 106, 107, 107] #胡
    # arr = [101, 101, 102, 102, 103, 104, 105, 106, 107, 107, 108, 108, 109, 109] #不胡
    # arr = [101, 101, 101, 102, 102, 103, 104, 104, 105, 105, 106, 107, 107, 107] #胡
    # arr = [101, 101, 101, 102, 103, 104, 105, 106, 107, 108, 108, 109, 109, 109] #胡
    arr = [101, 101, 101, 102, 102, 104, 105, 106, 107, 108, 108, 109, 109, 109] #不胡
    # arr = [101, 101, 101, 102, 102, 104, 105, 106, 107, 108, 108, 109, 109, 109] #不胡
    # arr = [101, 101, 101, 102, 102, 103, 103, 104, 104, 105, 105, 105, 109, 109] #胡
    if mj.isHu(arr,102):
        print ("胡啦胡啦")
    else:
        print "抱歉你还不能胡哦"
if __name__ == "__main__":
    initLog()
    initCache()
    main()
    # test()



