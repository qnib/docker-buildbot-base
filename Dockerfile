FROM qnib/alpn-python

ENV security_updates_as_of 2016-06-20
# We install as much as possible python packages from the distro in order to avoid
# having to pull gcc for building native extensions
# Some packages are at the moment (06/2016) only available on @testing
RUN \
    echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache \
    python \
    py-pip \
    py-psycopg2 py-twisted py-cryptography \
    py-service_identity@testing py-sqlalchemy@testing \
    gosu@testing dumb-init@testing\
    py-jinja2 && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools
