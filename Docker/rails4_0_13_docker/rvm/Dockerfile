FROM ubuntu:18.04

COPY cacert.pem /usr/local/src/
ENV  PATH=$PATH:/usr/local/rvm/bin
RUN set -eux; \
  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list; \
  apt-get clean; \
  apt-get update; \
  apt-get install -y --no-install-recommends curl gnupg2; \
  rm -rf /var/lib/apt/lists/*; \
  export SSL_CERT_FILE=/usr/local/src/cacert.pem; \
  curl -sSL 'https://rvm.io/mpapis.asc' | gpg2 --import -; \
  curl -sSL 'https://rvm.io/pkuczynski.asc' | gpg2 --import -; \
  curl -sSL https://get.rvm.io | bash -s stable
CMD ['bash']