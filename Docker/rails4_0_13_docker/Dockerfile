FROM udesk/rvm_ruby:0.0.2

RUN /bin/bash -c "set -eux; \
  rvm install 2.1.1; \
  source ~/.bashrc; \
  source /etc/profile.d/rvm.sh; \
  export SSL_CERT_FILE=/usr/local/src/cacert.pem; \
  rvm use ruby-2.1.1 --default; \
  gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/; \
  gem install bundler -v 1.16; \
  ruby --version; \
  bundle --version; \
	gem --version"

CMD ["irb"]