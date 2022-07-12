# grafana-reporter

## Build base puppeteer image
```
docker build -f Dockerfile_puppeteer . -t verces/puppeteer:latest
```

## Build grafana-reporter
ENV will be provided in k8s
```
node grafana_pdf.js $URL $APITOKEN $OUTPUT
```

## Send SMTP2GO / Object Storage - TO DO



