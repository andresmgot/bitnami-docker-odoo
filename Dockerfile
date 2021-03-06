FROM gcr.io/stacksmith-images/minideb:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=odoo \
    BITNAMI_IMAGE_VERSION=9.0.20160620-r7 \
    PATH=/opt/bitnami/python/bin:/opt/bitnami/node/bin:/opt/bitnami/postgresql/bin:$PATH

# System packages required
RUN install_packages libc6 libssl1.0.0 libncurses5 libtinfo5 zlib1g libsqlite3-0 libreadline6 libxslt1.1 libxml2 liblzma5 libedit2 libbsd0 libbz2-1.0 libstdc++6 libgcc1 ghostscript imagemagick libmysqlclient18 libpq5 libgssapi-krb5-2 libldap-2.4-2 libkrb5-3 libk5crypto3 libcomerr2 libkrb5support0 libkeyutils1 libsasl2-2 libgnutls-deb0-28 libp11-kit0 libtasn1-6 libnettle4 libhogweed2 libgmp10 libffi6 libgcrypt20 libgpg-error0 libjpeg62-turbo

# Additional modules required
RUN bitnami-pkg install python-2.7.13-0 --checksum 7f5aac196054c7eb04c981243b4ddf37020cc3eb8a7cdc69d72da57212b21573
RUN bitnami-pkg install postgresql-client-9.6.1-1 --checksum 9a793e2413490cdf5f9fdd1e9923f7a30ee196b5348a11583c1a4136893f39f8
RUN bitnami-pkg install node-6.9.4-0 --checksum aa0fe4923ece714285ed4ed63877e769b2bcf80c16d274d50db4d601541b64f4

# Install odoo
RUN bitnami-pkg unpack odoo-9.0.20160620-1 --checksum 32276addc873e3bd4499c7dcb0c3e14e3655679b3bbfc691916bf2a4b81cecc7

COPY rootfs /

VOLUME ["/bitnami/odoo"]

EXPOSE 8069 8071

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["nami", "start", "--foreground", "odoo"]
