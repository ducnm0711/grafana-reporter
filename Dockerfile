FROM buildkite/puppeteer

WORKDIR .

RUN groupadd -g 1001 reporter \
	&& useradd --create-home -d /home/reporter -g reporter -u 1001 reporter

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6494C6D6997C215E
RUN apt-get update
RUN apt-get install -y mutt awscli curl
RUN rm -rf /var/lib/apt/lists/*

COPY grafana_pdf.js grafana_pdf_exporter.sh sendgridSendEmail.sh  ./

USER reporter
ENV HOME /home/reporter
RUN mkdir -p $HOME/.mutt/cache/headers $HOME/.mutt/cache/bodies \
	&& touch $HOME/.mutt/certificates

ENV LANG C.UTF-8

COPY muttrc $HOME/.muttrc

# just run the container doing nothing
ENTRYPOINT ["sh", "-c", "sleep infinity"]
