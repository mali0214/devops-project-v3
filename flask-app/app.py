from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome to the Flask App!'

@app.route('/another-route')
def another_route():
    return 'Another page'

@app.route('/some-post-endpoint', methods=['POST'])
def post_endpoint():
    data = request.get_json()
    return jsonify({"message": "Success"}), 200

# Health check route
@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
