#!/bin/bash
dialog --yesno 'are you happy?' 5 20
case $? in
   0) echo "YES, you are happy.";;
   1) echo "NO, where is problem?";;
esac
