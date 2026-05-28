#!/bin/bash

# -------------------------------------------------------------------------
#  Note: Some of the downloads on this site have published SHA-2 values.
#  To allow verification of the integrity of these values, even in a
#  worst-case scenario (for example, if the download site were fully
#  compromised), they have been cryptographically signed off-site using a
#  private key that is not stored on this server. A copy of the
#  corresponding public key is available on an independent website.
# --------------------------------------------------------------------------

wget https://www.emtec.com/downloads/zoc/zoc9032.sha2
wget https://www.emtec.com/downloads/zoc/zoc9032.sha2.sig

# if we are in full paranoia mode, in order to idependently verify the 
# signture, we should only use the off-site copy of sha2-public-key.pem.
wget https://raw.githubusercontent.com/zocterminal/.well-known/d7ffe91866e35744dc08f0e71a3a563b865f1244/sha2-public-key.pem

printf "\nSHA-2 values are:\n"
cat zoc9032.sha2 | tr ';' '\n'

printf "\nSignature of SHA-2 list:\n"
cat zoc9032.sha2.sig

printf "\n\nVerifying the integrity of the file containing the SHA-2 values:\n"
openssl base64 -d -in zoc9032.sha2.sig -out zoc9032.sha2.bsig
openssl dgst -sha256 -verify sha2-public-key.pem -signature zoc9032.sha2.bsig zoc9032.sha2

