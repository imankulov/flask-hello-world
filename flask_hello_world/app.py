import os
import socket

from flask import Flask, jsonify, request

app = Flask(__name__)


HELLO_WORLD_MESSAGE = os.getenv("HELLO_WORLD_MESSAGE", "Hello, world")


@app.route("/")
def hello_world():
    return jsonify(
        {
            "message": HELLO_WORLD_MESSAGE,
            "server_hostname": socket.gethostname(),
            "remote_addr": request.remote_addr,
            "http_host": request.host,
        }
    )
