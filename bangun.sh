#!/bin/sh
# Bungkus starter jadi zip yang disajikan di public/. Jalankan ulang setiap kali isi starters/ berubah, lalu commit.
set -e
cd "$(dirname "$0")/starters"
rm -f ../public/hyperframes/hyperframes-video-starter.zip
zip -rq -X ../public/hyperframes/hyperframes-video-starter.zip hyperframes-video-starter \
  -x '*/renders/*' '*/.hyperframes/*' '*.DS_Store'
ls -l ../public/hyperframes/hyperframes-video-starter.zip
