#!/bin/bash

if [[ -z $1 ]];then echo USAGE: ./pull.sh com.evil.corp;exit -1;fi
APK=`adb shell pm path $1 | awk -F':' '{print $2}'`
if [[ -z $APK ]];then echo Application doesnt exists: $1;exit -1;fi
adb shell cp $APK /storage/emulated/0/Download/$1.apk
adb pull /storage/emulated/0/Download/$1.apk ./
adb shell rm /storage/emulated/0/Download/$1.apk