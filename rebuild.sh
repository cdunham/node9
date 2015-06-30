set -e
[ -d libuv ] || git clone https://github.com/libuv/libuv.git
pushd libuv && sh autogen.sh && ./configure --disable-shared && make && popd
[ -d luajit ] || git clone http://luajit.org/git/luajit-2.0.git luajit
pushd luajit && make -C src libluajit.a && popd
premake5 clean
premake5 gmake
make clean
make
