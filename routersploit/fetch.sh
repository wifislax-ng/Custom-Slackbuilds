#!/bin/sh

REPO=https://github.com/threat9
PRGNAM=routersploit
CLONE=$REPO/$PRGNAM

rm -rf $PRGNAM
git clone $CLONE

( cd $PRGNAM 
  git checkout master || exit 1
)

HEADISAT="$( cd $PRGNAM && git log -1 --format=%h )"
DATE="$( cd $PRGNAM && git log -1 --format=%cd --date=format:%Y%m%d )"
LONGDATE="$( cd $PRGNAM && git log -1 --format=%cd --date=format:%c )"
mv $PRGNAM $PRGNAM-${DATE}_${HEADISAT}
tar cf $PRGNAM-${DATE}_${HEADISAT}.tar $PRGNAM-${DATE}_${HEADISAT}
xz -9 -f $PRGNAM-${DATE}_${HEADISAT}.tar
rm -rf $PRGNAM-${DATE}_${HEADISAT}
touch -d "$LONGDATE" $PRGNAM-${DATE}_${HEADISAT}.tar.xz
