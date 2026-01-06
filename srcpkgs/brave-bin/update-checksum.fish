#!/usr/bin/fish

echo "Update version checksum"
set VERSION (cat template | rg 'version=' | cut -d "=" -f 2)

set DOWNLOAD_URL https://github.com/brave/brave-browser/releases/download/v{$VERSION}/brave-browser_{$VERSION}_amd64.deb.sha256
set CHECKSUM (wget "$DOWNLOAD_URL" -q --output-document - | cut -d " " -f 1)

sed -i "s/^checksum=.*/checksum=$CHECKSUM/" template
echo "Template updated"

