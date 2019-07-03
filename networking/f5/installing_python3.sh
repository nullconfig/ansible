# verify if packages is installed
# rpm -qa | grep <package>
# rpm -q --requires

curl http://mirror.centos.org/centos/7/os/x86_64/Packages/autoconf-2.69-11.el7.noarch.rpm -o autoconf-2.69-11.el7.noarch.rpm
rpm -i --nosignature autoconf-2.69-11.el7.noarch.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/perl-Thread-Queue-3.02-2.el7.noarch.rpm -o perl-Thread-Queue-3.02-2.el7.noarch.rpm
rpm -i --nosignature perl-Thread-Queue-3.02-2.el7.noarch.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/automake-1.13.4-3.el7.noarch.rpm -o automake-1.13.4-3.el7.noarch.rpm
rpm -i --nosignature automake-1.13.4-3.el7.noarch.rpm

# upgraded binutils
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/binutils-2.27-34.base.el7.x86_64.rpm -o binutils-2.27-34.base.el7.x86_64.rpm
rpm -Uvh --nosignature binutils-2.27-34.base.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/bison-3.0.4-2.el7.x86_64.rpm -o bison-3.0.4-2.el7.x86_64.rpm
rpm -i --nosignature bison-3.0.4-2.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/flex-2.5.37-6.el7.x86_64.rpm -o flex-2.5.37-6.el7.x86_64.rpm
rpm -i --nosignature flex-2.5.37-6.el7.x86_64.rpm

# Dependencies for gcc
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/mpfr-3.1.1-4.el7.x86_64.rpm -o mpfr-3.1.1-4.el7.x86_64.rpm
rpm -i --nosignature mpfr-3.1.1-4.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libmpc-1.0.1-3.el7.x86_64.rpm -o libmpc-1.0.1-3.el7.x86_64.rpm
rpm -i --nosignature libmpc-1.0.1-3.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/cpp-4.8.5-36.el7.x86_64.rpm -o cpp-4.8.5-36.el7.x86_64.rpm
rpm -i --nosignature cpp-4.8.5-36.el7.x86_64.rpm

# glibc upgraded
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/glibc-common-2.17-260.el7.x86_64.rpm -o glibc-common-2.17-260.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/glibc-2.17-260.el7.x86_64.rpm -o glibc-2.17-260.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/glibc-2.17-260.el7.i686.rpm -o glibc-2.17-260.el7.i686.rpm
rpm -Uvh --nosignature glibc-2.17-260.el7.x86_64.rpm glibc-common-2.17-260.el7.x86_64.rpm glibc-2.17-260.el7.i686.rpm

# glibc dependencies
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/glibc-devel-2.17-260.el7.x86_64.rpm -o glibc-devel-2.17-260.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/glibc-headers-2.17-260.el7.x86_64.rpm -o glibc-headers-2.17-260.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/kernel-headers-3.10.0-957.el7.x86_64.rpm -o kernel-headers-3.10.0-957.el7.x86_64.rpm
rpm -i --nosignature glibc-devel-2.17-260.el7.x86_64.rpm glibc-headers-2.17-260.el7.x86_64.rpm kernel-headers-3.10.0-957.el7.x86_64.rpm

# upgraded libgcc
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libgcc-4.8.5-36.el7.x86_64.rpm -o libgcc-4.8.5-36.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libgcc-4.8.5-36.el7.i686.rpm -o libgcc-4.8.5-36.el7.i686.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libgomp-4.8.5-36.el7.x86_64.rpm -o libgomp-4.8.5-36.el7.x86_64.rpm 
rpm -Uvh --nosignature libgcc-4.8.5-36.el7.x86_64.rpm libgcc-4.8.5-36.el7.i686.rpm libgomp-4.8.5-36.el7.x86_64.rpm

# install gcc
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/gcc-4.8.5-36.el7.x86_64.rpm -o gcc-4.8.5-36.el7.x86_64.rpm
rpm -i --nosignature gcc-4.8.5-36.el7.x86_64.rpm

# gcc-c++
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libstdc++-4.8.5-36.el7.x86_64.rpm -o libstdc++-4.8.5-36.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libstdc++-4.8.5-36.el7.i686.rpm -o libstdc++-4.8.5-36.el7.i686.rpm
rpm -Uvh --nosignature libstdc++-4.8.5-36.el7.x86_64.rpm libstdc++-4.8.5-36.el7.i686.rpm 
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/libstdc++-devel-4.8.5-36.el7.x86_64.rpm -o libstdc++-devel-4.8.5-36.el7.x86_64.rpm
rpm -i --nosignature libstdc++-devel-4.8.5-36.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/gcc-c++-4.8.5-36.el7.x86_64.rpm -o gcc-c++-4.8.5-36.el7.x86_64.rpm
rpm -i --nosignature gcc-c++-4.8.5-36.el7.x86_64.rpm

# gettext 
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/gettext-0.19.8.1-2.el7.x86_64.rpm -o gettext-0.19.8.1-2.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/gettext-libs-0.19.8.1-2.el7.x86_64.rpm -o gettext-libs-0.19.8.1-2.el7.x86_64.rpm
curl http://mirror.centos.org/centos/7/os/x86_64/Packages/gettext-libs-0.19.8.1-2.el7.x86_64.rpm -o 
rpm -i --nosignature gettext-libs-0.19.8.1-2.el7.x86_64.rpm
rpm -Uvh --nosignature gettext-0.19.8.1-2.el7.x86_64.rpm

install next: git libexpat1-dev libssl-dev zlib1g-dev \
  libncurses5-dev libbz2-dev liblzma-dev \
  libsqlite3-dev libffi-dev tcl-dev linux-headers-generic libgdbm-dev \
  libreadline-dev tk tk-dev

  
  git clone https://github.com/python/cpython.git
  cd cpython && ./configure --prefix=/usr \
  --enable-loadable-sqlite-extensions \
  --enable-shared \
  --with-lto \
  --enable-optimizations \
  --with-system-expat \
  --with-system-ffi \
  --enable-ipv6 --with-threads --with-pydebug --disable-rpath \
  && make \
  && sudo make install
