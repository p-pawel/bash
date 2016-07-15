#!/bin/sh

# Copied from:
# https://tty1.net/blog/2015/using-letsencrypt-in-manual-mode_en.html

#
# Wrapper script for the letsencrypt client to generate a server certificate in
# manual mode. It uses openssl to generate the key and should not modify the
# server configuration. It can be called off-side, i.e. not on the destination
# server.
#
# usage: gencert DOMAIN [DOMAIN...]
#
# This is free and unencumbered software released into the public domain.
# For more information, please refer to http://unlicense.org/

set -e

if [ $# -lt 1 ]; then
    echo "$0: error: at least one domain name required."
    exit 1
fi
domain=$1

shift
other_domains=
while [ $# -gt 0 ]; do
    other_domains="$other_domains,DNS:$1"
    shift
done


country=UK
state="Some State"
town="Some Place"
email=webmaster@example.com

outdir="certs/$domain"
key="$outdir/privkey1.pem"
csr="$outdir/signreq.der"

if [ -d "$outdir" ]; then
    echo "output directory $outdir exists"
    exit 1
fi

tmpdir=
cleanup() {
    if [ -n "$tmpdir" -a -d "$tmpdir" ]; then
        rm -rf "$tmpdir"
    fi
}
trap cleanup INT QUIT TERM EXIT
tmpdir=`mktemp -d -t mkcert-XXXXXXX`

sslcnf="$tmpdir/openssl.cnf"
cat /etc/ssl/openssl.cnf > "$sslcnf"
echo "[SAN]" >> "$sslcnf"
echo "subjectAltName=DNS:$domain$other_domains" >> "$sslcnf"

mkdir -p "$outdir"
openssl req \
    -new -newkey rsa:2048 -sha256 -nodes \
    -keyout "$key" -out "$csr" -outform der \
    -subj "/C=$country/ST=$state/L=$town/O=$domain/emailAddress=$email/CN=$domain" \
    -reqexts SAN \
    -config "$sslcnf"

letsencrypt certonly \
    --authenticator manual \
    --server https://acme-v01.api.letsencrypt.org/directory --text \
    --config-dir letsencrypt/etc --logs-dir letsencrypt/log \
    --work-dir letsencrypt/lib --email "$email" \
    --csr "$csr"
