#!/bin/bash

# Wrapper for grafana_pdf.js

# set -x

GRAFANA_URL=${GRAFANA_URL}
GRAFANA_API_KEY=${GRAFANA_API_KEY}
GRAFANA_OUTPUT=${GRAFANA_OUTPUT}

# Node.js require us to pass environment variables this way
node grafana_pdf.js $GRAFANA_URL $GRAFANA_API_KEY $GRAFANA_OUTPUT

# This script is loaded in Configmap