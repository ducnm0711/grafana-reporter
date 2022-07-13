# FROM buildkite/puppeteer
FROM verces/puppeteer:latest

WORKDIR .

# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6494C6D6997C215E
RUN apt-get update
RUN apt-get install -y awscli curl
RUN rm -rf /var/lib/apt/lists/*

COPY grafana_pdf.js export.sh ./

RUN chmod +x ./export.sh
# just run the container doing nothing
ENTRYPOINT ["sh", "-c", "sleep infinity"]
