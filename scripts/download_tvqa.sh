# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.
# Modified from UNITER
# (https://github.com/ChenRocks/UNITER)

DOWNLOAD=$1

for FOLDER in 'video_db' 'txt_db' 'pretrained' 'finetune'; do
    if [ ! -d $DOWNLOAD/$FOLDER ] ; then
        mkdir -p $DOWNLOAD/$FOLDER
    fi
done

BLOB='https://convaisharables.blob.core.windows.net/hero'

# video dbs
if [ ! -d $DOWNLOAD/video_db/tv/ ] ; then
    wget $BLOB/video_db/tv.tar -P $DOWNLOAD/video_db/
    tar -xvf $DOWNLOAD/video_db/tv.tar -C $DOWNLOAD/video_db

# text dbs
for SPLIT in 'train' 'val' 'test_public'; do
    wget $BLOB/txt_db/tvqa_$SPLIT.db.tar -P $DOWNLOAD/txt_db/
    tar -xvf $DOWNLOAD/txt_db/tvqa_$SPLIT.db.tar -C $DOWNLOAD/txt_db
done
if [ ! -d $DOWNLOAD/txt_db/tv_subtitles/ ] ; then
    wget $BLOB/txt_db/tv_subtitles.tar -P $DOWNLOAD/txt_db/
    tar -xvf $DOWNLOAD/txt_db/tv_subtitles.tar -C $DOWNLOAD/txt_db

# pretrained
if [ ! -f $DOWNLOAD/pretrained/hero-tv-ht100.pt ] ; then
    wget $BLOB/pretrained/hero-tv-ht100.pt -P $DOWNLOAD/pretrained/
fi
