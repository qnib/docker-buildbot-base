FROM qnib/alpn-python

ENV security_updates_as_of=2016-06-20 \
    BUILDBOT_VER=0.9.0rc1
# We install as much as possible python packages from the distro in order to avoid
# having to pull gcc for building native extensions
# Some packages are at the moment (06/2016) only available on @testing
RUN \
    echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache openssl \
    py-psycopg2 py-twisted py-cryptography \
    py-service_identity@testing py-sqlalchemy@testing \
    git make \
    gosu@testing dumb-init@testing\
    py-jinja2 && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip 
#RUN pip install  --pre "buildbot[bundle]==${BUILDBOT_VER}"
