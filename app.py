from flask import Flask, request, render_template, redirect
from flask.logging import create_logger
import logging
import json

import pandas as pd
from sklearn.externals import joblib
from sklearn.preprocessing import StandardScaler

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)

def scale(payload):
    """Scales Payload"""
    
    LOG.info(f"Scaling Payload: \n{payload}")
    scaler = StandardScaler().fit(payload.astype(float))
    scaled_adhoc_predict = scaler.transform(payload.astype(float))
    return scaled_adhoc_predict

@app.route("/")
def home():    
    return render_template('index.html')

@app.route("/predict", methods=['POST', 'GET'])
def predict():
    """Performs an sklearn prediction
        
        input looks like:
        {
        "CHAS":{
        "0":0
        },
        "RM":{
        "0":6.575
        },
        "TAX":{
        "0":296.0
        },
        "PTRATIO":{
        "0":15.3
        },
        "B":{
        "0":396.9
        },
        "LSTAT":{
        "0":4.98
        }
        
        result looks like:
        { "prediction": [ <val> ] }
        
        """
    if request.method == 'POST':
        # collect inputs from form:
        json_payload = {
            "CHAS": {
                "0": request.form['chas']
            },
            "RM": {
                "0": request.form['rm']
            },
            "TAX": {
                "0": request.form['tax']
            },
            "PTRATIO": {
                "0": request.form['ptratio']
            },
            "B": {
                "0": request.form['b']
            },
            "LSTAT": {
                "0": request.form['lstat']
            }
        }

        # Logging the input payload
        # json_payload = request.json
        LOG.info(f"JSON payload: \n{json.dumps(json_payload)}")
        inference_payload = pd.DataFrame(json_payload)
        LOG.info(f"Inference payload DataFrame: \n{inference_payload}")
        # scale the input
        scaled_payload = scale(inference_payload)
        # get an output prediction from the pretrained model, clf
        prediction = list(clf.predict(scaled_payload))
        # TO DO:  Log the output prediction value
        LOG.info(f"Prediction output: {prediction}")
        # return jsonify({'prediction': prediction})
        return render_template('index.html', form_values = json_payload, prediction = prediction)
    # if GET request
    return redirect('/')

if __name__ == "__main__":
    # load pretrained model as clf
    clf = joblib.load("./model_data/boston_housing_prediction.joblib")
    app.run(host='0.0.0.0', port=80, debug=True) # specify port=80
