from flask import Flask, jsonify, request
import os
import datetime

app = Flask(__name__)

# Get environment variables
APP_NAME = os.getenv('APP_NAME', 'DevOps Sandbox')
VERSION = os.getenv('VERSION', '1.0.0')
ENVIRONMENT = os.getenv('ENVIRONMENT', 'development')

@app.route('/')
def home():
    return jsonify({
        'message': f'Welcome to {APP_NAME}',
        'version': VERSION,
        'environment': ENVIRONMENT,
        'timestamp': datetime.datetime.utcnow().isoformat()
    })

@app.route('/health')
def health():
    return jsonify({
        'status': 'healthy',
        'timestamp': datetime.datetime.utcnow().isoformat()
    })

@app.route('/api/info')
def info():
    return jsonify({
        'app_name': APP_NAME,
        'version': VERSION,
        'environment': ENVIRONMENT,
        'hostname': os.getenv('HOSTNAME', 'unknown')
    })

@app.route('/api/echo', methods=['POST'])
def echo():
    data = request.get_json() or {}
    return jsonify({
        'echo': data,
        'timestamp': datetime.datetime.utcnow().isoformat()
    })

if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)

