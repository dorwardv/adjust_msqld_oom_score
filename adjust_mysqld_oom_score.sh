#!/bin/bash
OOM_SCORE=`cat /proc/$(pidof mysqld)/oom_score`
if [ "$OOM_SCORE" -gt 20 ]
then
 OOM_ADJUST=$((OOM_SCORE - 20))
 echo "adjust oom_score_adj by $OOM_ADJUST"
 echo "-$OOM_ADJUST" > /proc/$(pidof mysqld)/oom_score_adj
fi
