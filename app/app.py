from flask import Flask, jsonify
import datetime

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({
        "status": "ok",
        "service": "cyberwatch-demo",
        "timestamp": datetime.datetime.utcnow().isoformat()
    })

@app.route("/health")
def health():
    return jsonify({"healthy": True})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)