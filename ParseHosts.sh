#!/bin/bash
declare -A lists
lists+=( ["easylist.txt"]=https://easylist-downloads.adblockplus.org/ ["malwaredomains_full.txt"]=https://easylist-downloads.adblockplus.org/ ["abpindo.txt"]=https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/ ["adblock_bg.txt"]=http://stanev.org/abp/ ["easylistchina.txt"]=https://easylist-downloads.adblockplus.org/ ["cjx-annoyance.txt"]=https://raw.githubusercontent.com/cjx82630/cjxlist/master/ ["filters.txt"]=https://raw.githubusercontent.com/tomasko126/easylistczechandslovak/master/ ["easylistdutch.txt"]=https://easylist-downloads.adblockplus.org/ ["easylistgermany.txt"]=https://easylist-downloads.adblockplus.org/ ["EasyListHebrew.txt"]=https%3A//raw.githubusercontent.com/easylist/EasyListHebrew/master/ )
cd ./lists
for key in "${!lists[@]}"
do
	request=${lists[$key]}${key}
	curl -s -L "$request" > "${key/txt/unsorted}"
	sort -u "${key/txt/unsorted}" | grep ^\|\|.*\^$ | grep -v \/ > "${key/txt/sorted}"
	sed 's/[\|^]//g' < "${key/txt/sorted}" > "${key/txt/host}"
	rm "${key/txt/unsorted}" "${key/txt/sorted}"
done
cd ./..

