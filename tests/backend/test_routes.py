import pytest
from backend.app import app

# Create a test client for the Flask app
@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

# Test case: Check if the home route returns the correct response
def test_home_route(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Welcome to CollabSphere Backend" in response.data

# Test case: Check if a non-existent route returns a 404 error
def test_invalid_route(client):
    response = client.get('/invalid')
    assert response.status_code == 404