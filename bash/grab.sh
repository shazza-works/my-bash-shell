# this is a list downloader
for i in `cat list`
do
  youtube-dl $i
  sleep 5
done
