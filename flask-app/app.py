from flask import Flask, jsonify, request
import logging

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

@app.route('/')
def home():
    app.logger.info('Home route accessed')
    return 'Welcome to the Flask App!'

@app.route('/another-route')
def another_route():
    app.logger.info('Another route accessed')
    return 'Another page'

@app.route('/some-post-endpoint', methods=['POST'])
def post_endpoint():
    data = request.get_json()
    app.logger.info(f'POST data received: {data}')
    return jsonify({"message": "Success"}), 200

# Health check route
@app.route('/health')
def health():
    app.logger.info('Health check accessed')
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
