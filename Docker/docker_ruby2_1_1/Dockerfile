FROM ubuntu:16.04

# skip installing gem documentation
RUN set -eux; \
	mkdir -p /usr/local/etc; \
	{ \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

ENV RUBY_MAJOR 2.1
ENV RUBY_VERSION 2.1.1
ENV RUBY_DOWNLOAD_SHA256 c843df31ae88ed49f5393142b02b9a9f5a6557453805fd489a76fbafeae88941
ENV RUBYGEMS_VERSION 2.2.2

RUN set -eux; \
  \
  savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
    wget \
	; \
	rm -rf /var/lib/apt/lists/*; \
	\
  wget -O /usr/local/src/cacert.pem "http://curl.haxx.se/ca/cacert.pem" --no-check-certificate

ENV SSL_CERT_FILE /usr/local/src/cacert.pem

# some of ruby's build scripts are written in ruby
#   we purge system ruby later to make sure our final image uses what we just built
RUN set -eux; \
	\
  savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
  apt-get install -y --no-install-recommends \
    openssl \
		bison \
    wget \
    gcc \
		dpkg-dev \
		libgdbm-dev \
		ruby \
    zlib1g \
    zlib1g.dev \
	; \
	rm -rf /var/lib/apt/lists/*; \
	\
  wget -O openssl.tar.gz "https://www.openssl.org/source/openssl-1.0.2g.tar.gz"; \
  mkdir -p /usr/src/openssl; \
  tar -xzvf openssl.tar.gz -C /usr/src/openssl --strip-components=1; \
  rm openssl.tar.gz; \
  \
  cd /usr/src/openssl; \
  ./config --prefix=/usr/local/; \
  perl -p -i -e "s/CFLAG= -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -Wa,--noexecstack -m64 -DL_ENDIAN -O3 -Wall -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM/CFLAG= -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -Wa,--noexecstack -m64 -DL_ENDIAN -O3 -Wall -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -fPIC/g" Makefile; \
  make && make install; \
  rm -f /usr/bin/openssl; \
  ln -s /usr/local/bin/openssl /usr/bin/openssl; \
  cd /etc/; \
  echo "/usr/local/lib" >> ld.so.conf; \
  ldconfig; \
  \
	wget -O ruby.tar.gz "https://cache.ruby-china.com/pub/ruby/${RUBY_MAJOR}/ruby-$RUBY_VERSION.tar.gz"; \
	echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.gz" | sha256sum --check --strict; \
	\
	mkdir -p /usr/src/ruby; \
	tar -xzvf  ruby.tar.gz -C /usr/src/ruby --strip-components=1; \
	rm ruby.tar.gz; \
	\
	cd /usr/src/ruby; \
	\
# hack in "ENABLE_PATH_CHECK" disabling to suppress:
#   warning: Insecure world writable dir
	{ \
		echo '#define ENABLE_PATH_CHECK 0'; \
		echo; \
		cat file.c; \
	} > file.c.new; \
	mv file.c.new file.c; \
	\

	gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"; \
	./configure \
		--build="$gnuArch" \
		--disable-install-doc \
		--enable-shared \
    --with-openssl-dir=/usr/local/ssl \
	; \
	make -j "$(nproc)"; \
	make install; \
	\
	apt-mark auto '.*' > /dev/null; \
	apt-mark manual $savedAptMark > /dev/null; \
	find /usr/local -type f -executable -not \( -name '*tkinter*' \) -exec ldd '{}' ';' \
		| awk '/=>/ { print $(NF-1) }' \
		| sort -u \
		| xargs -r dpkg-query --search \
		| cut -d: -f1 \
		| sort -u \
		| xargs -r apt-mark manual \
	; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	\
	cd /; \
	rm -r /usr/src/ruby; \
  gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/; \
	gem update --system "$RUBYGEMS_VERSION" && rm -r /root/.gem/; \
  gem install bundler -v 1.16; \

# verify we have no "ruby" packages installed
	! dpkg -l | grep -i ruby; \
	[ "$(command -v ruby)" = '/usr/local/bin/ruby' ]; \
# rough smoke test
	ruby --version; \
  bundle --version; \
	gem --version

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
# path recommendation: https://github.com/bundler/bundler/pull/6469#issuecomment-383235438
ENV PATH $GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"
# (BUNDLE_PATH = GEM_HOME, no need to mkdir/chown both)


CMD ["irb"]