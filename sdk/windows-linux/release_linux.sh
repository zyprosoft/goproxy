#/bin/bash
VER="v4.7"

rm -rf sdk-linux-*.tar.gz
rm -rf README.md proxy-sdk.so proxy-sdk.h proxy-sdk.a

#linux 32bit
CGO_ENABLED=1 GOARCH=386 GOOS=linux go build -buildmode=c-archive -ldflags "-s -w" -o proxy-sdk.a sdk.go
CGO_ENABLED=1 GOARCH=386 GOOS=linux go build -buildmode=c-shared -ldflags "-s -w" -o proxy-sdk.so sdk.go
cp ../README.md .
tar zcf sdk-linux-32bit-${VER}.tar.gz README.md proxy-sdk.so proxy-sdk.a proxy-sdk.h
rm -rf README.md proxy-sdk.so proxy-sdk.h proxy-sdk.a

#linux 64bit
CGO_ENABLED=1 GOARCH=amd64 GOOS=linux go build -buildmode=c-archive -ldflags "-s -w" -o proxy-sdk.a sdk.go
CGO_ENABLED=1 GOARCH=amd64 GOOS=linux go build -buildmode=c-shared -ldflags "-s -w" -o proxy-sdk.so sdk.go
cp ../README.md .
tar zcf sdk-linux-64bit-${VER}.tar.gz README.md proxy-sdk.so proxy-sdk.a proxy-sdk.h
rm -rf README.md proxy-sdk.so proxy-sdk.h proxy-sdk.a


echo "done."