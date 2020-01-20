import pytest

from flask_hello_world.app import app


@pytest.fixture
def client():
    with app.test_client() as client:
        yield client


def test_foo(client):
    resp = client.get("/").json
    assert resp["message"] == "Hello, world"
