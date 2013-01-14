#!/bin/bash
# origin http://blog.sourcetreeapp.com/2012/02/08/custom-actions-more-power-to-you/#comment-639272285
email=$(git log -1 --format="%an <%ae>" $1)
subject=$(git log -1 --format="Re: %s" $1)
body=$(git diff $1^..$1 | sed "s/^\([^m]\)/> \1/" | sed "s/ / /g" | sed "s/ / /g")

email="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$email")"
subject="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$subject")"
body="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$body")"

open "mailto:$email?subject=$subject&body=$body"