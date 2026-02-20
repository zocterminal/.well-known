# VERIFYING A ZOC TERMINAL VERSION

If an update-download in ZOC failed any you got redirected to here, please 
understand that while the reason is most likely benign (like someone 
accidentally deleted a file that is related to the verification process), 
but the instructions here will scale up to the most catastrophic error (e.g.,
a complete take-over of our website).

Depending on your level of paranoia, feel free to just wait for things to 
fix themselves or go through the full checking process.

1. Download the software from https://www.emtec.com/zoc/index.html
2. Do not start it! 
3. Instead verify the Code-Signing certificate (see below)
4. If that checks out, you are 99.5% good
5. In this repository (above) look for the `*.sha2.*` files that matches your
  version number, especially `zoc*.sha2.README.txt` and follow the instructions there
  to verify the SHA-2 value of the download and of the `zoc*.sha2` file itself.
7. If they all check out also, you are 99.999% good

&nbsp;

## Verify Code-Signing Certificate:

A code-signing certificate is something akin to an SSL certificate, 
but for software. It certifies that a given software was published by a 
certain person (ask Google or your favorite AI how this works).

To check the code-signing of a file that you downloaded:

MacOS: `codesign -dvv zoc9999.dmg`
  
Windows PowerShell: `Get-AuthenticodeSignature zoc9999_x64.exe | Format-List Signer*,Status*`

The message should say that the verificatin is okay, and you should see the name `Markus Schmidt` 
as author or subject in the certificate chain.  The certification authority should be Sectigo (Windows) 
or Apple (macOS).

&nbsp;
