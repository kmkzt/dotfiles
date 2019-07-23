if [ $# == 0 ]; then
  echo 'Usage: get_gitignore.sh node,rust'
  exit 1
fi

IGNORE_IO_URL=https://gitignore.io/api/LANGUAGELIST
CURL_URL=${IGNORE_IO_URL/LANGUAGELIST/$1/}
echo `generate by $curl_url`
curl $CURL_URL > .gitignore
