FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    gsfonts \
    pdftk \
    libcurl4-gnutls-dev

# install wkhtmltopdf
RUN wget --quiet -O wkhtmltopdf.tar.xz http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
  tar xf wkhtmltopdf.tar.xz # && \
  mv wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf && \
  mv wkhtmltox/bin/wkhtmltoimage /usr/local/bin/wkhtmltoimage && \
  rm -rf wkhtmlto*

RUN wget --quiet -O wkhtmltopdf.tar.xz http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
  tar xf wkhtmltopdf.tar.xz && \
  apt-get install -y fontconfig libxext-dev libxrender-dev

RUN apt-get -y install fontconfig
RUN apt-get -y install libxext-dev libxrender-dev
RUN apt-get -y install libx11-dev

# also install wkhtmltopdf .9.9
RUN wget --quiet http://download.gna.org/wkhtmltopdf/obsolete/linux/wkhtmltopdf-0.9.9-static-amd64.tar.bz2 && \
  tar xf wkhtmltopdf-0.9.9-static-amd64.tar.bz2 && \
  mv wkhtmltopdf-amd64 /usr/local/bin/wkhtmltopdf.9
