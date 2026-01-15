import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_endpoint(client):
    """Test the home endpoint"""
    response = client.get('/')
    assert response.status_code == 200
    data = response.get_json()
    assert 'message' in data
    assert 'version' in data

def test_health_endpoint(client):
    """Test the health endpoint"""
    response = client.get('/health')
    assert response.status_code == 200
    data = response.get_json()
    assert data['status'] == 'healthy'

def test_info_endpoint(client):
    """Test the info endpoint"""
    response = client.get('/api/info')
    assert response.status_code == 200
    data = response.get_json()
    assert 'app_name' in data
    assert 'version' in data

def test_echo_endpoint(client):
    """Test the echo endpoint"""
    test_data = {'test': 'message', 'number': 123}
    response = client.post('/api/echo', json=test_data)
    assert response.status_code == 200
    data = response.get_json()
    assert 'echo' in data
    assert data['echo'] == test_data

