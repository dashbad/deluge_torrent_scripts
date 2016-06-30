#!/usr/bin/python

import sys
from deluge.ui.client import client
from twisted.internet import reactor

# Set up the logger to print out errors
from deluge.log import setupLogger
setupLogger()

d = client.connect()

torrent_id = sys.argv[1]

def on_connect_success(result):
    def on_get_torrent_status(torrent):
        print torrent["label"]
        client.disconnect()
        reactor.stop()

    client.core.get_torrent_status(torrent_id, ["label"]).addCallback(on_get_torrent_status)

d.addCallback(on_connect_success)

def on_connect_fail(result):
        print result
        reactor.stop() 

d.addErrback(on_connect_fail)

reactor.run()
