FROM ocrd/core:edge
MAINTAINER OCR-D
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONIOENCODING utf8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /build
COPY Makefile .
COPY setup.py .
COPY ocrd-tool.json .
COPY requirements.txt .
COPY ocrd_calamari ocrd_calamari

RUN make calamari/build
RUN pip3 install .

ENTRYPOINT ["/usr/local/bin/ocrd-calamari-recognize"]

