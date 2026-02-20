# ZOC SHA-2 VALUES

This archive contains SHA-2 checksums and public-keys for emtec.com and ZOC Terminal.

Note: in the comands below, replace `9999` with the respective version number

&nbsp;

## Verify Code-Signing Certificate:
MacOS: `codesign -dvv zoc9999.dmg`
  
Windows PowerShell: `Get-AuthenticodeSignature zoc9999_x64.exe | Format-List Signer*,Status*`

&nbsp;

## How to show your download's SHA-2:
MacOS: `openssl dgst -sha256 <filename>`

Windows PowerShell: `Get-FileHash -Algorithm SHA256 <filename>`

&nbsp;

## Reference SHA-2 values:
Check the  [current repository](https://github.com/zocterminal/.well-known) 
for `*.sha2` files matching the version number.

&nbsp;

## Signature for integrity checking of the SHA-2 values:
Check the  [current repository](https://github.com/zocterminal/.well-known) 
for `*.sha2.sig` files matching the version number.

&nbsp;

## The signature can be verified using the following public-key:
[https://www.emtec.com/.well-known/sha2-public-key.pem](https://github.com/zocterminal/.well-known/blob/master/sha2-public-key.pem)

&nbsp;

# Procedure to verify the integrity of the list of SHA-2 values:
    echo geting sha2-list, signature and public key
    wget https://www.emtec.com/downloads/zoc/zoc9999.sha2
    wget https://www.emtec.com/downloads/zoc/zoc9999.sha2.sig
    wget https://raw.githubusercontent.com/zocterminal/.well-known/d7ffe91866e35744dc08f0e71a3a563b865f1244/sha2-public-key.pem
    echo verifying sha2-list
    openssl base64 -d -in zoc9999.sha2.sig -out zoc9999.sha2.bsig
    openssl dgst -sha256 -verify sha2-public-key.pem -signature zoc9999.sha2.bsig zoc9999.sha2

See also: https://www.emtec.com/downloads/zoc/zoc9999.sha2.verify.sh

&nbsp;

## Alternate commands for Windows PowerShell:
`openssl dgst -sha256` --> `Get-FileHash -Algorithm SHA256 <filename>`
  
`wget`                 --> `Invoke-WebRequest <url> -OutFile <filename>`

&nbsp;
