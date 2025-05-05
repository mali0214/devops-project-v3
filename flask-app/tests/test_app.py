import pytest
from app import app

@pytest.fixture
def client():
    """Fixture to set up the Flask test client"""
    with app.test_client() as client:
        yield client

def test_home(client):
    """Test the home route"""
    response = client.get('/')
    assert response.status_code == 200
    assert b"Welcome" in response.data  # Assuming you have a welcome message on the homepage

def test_another_route(client):
    """Test another route (optional for your app)"""
    response = client.get('/another-route')
    assert response.status_code == 200
    assert b"Another page" in response.data  # Modify according to your actual response

def test_post_route(client):
    """Test a POST route (optional)"""
    response = client.post('/some-post-endpoint', json={"key": "value"})
    assert response.status_code == 200
    assert b"Success" in response.data  # Modify according to your actual response

