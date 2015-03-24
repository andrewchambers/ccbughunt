set -e
sudo apt-get -q -y update
sudo apt-get -q -y upgrade
sudo apt-get -q -y install indent astyle delta libbenchmark-timer-perl \
    libexporter-lite-perl libfile-which-perl libgetopt-tabular-perl \
    libregexp-common-perl libsys-cpu-perl flex build-essential \
    zlib1g-dev libedit-dev tcc
wget http://llvm.org/releases/3.5.1/clang+llvm-3.5.1-x86_64-linux-gnu.tar.xz
tar xf clang+llvm-3.5.1-x86_64-linux-gnu.tar.xz
sudo mkdir -p /opt/
sudo mv ./clang+llvm-3.5.1-x86_64-linux-gnu/ /opt/clang
export PATH=$PATH:/opt/clang/bin/
echo "export PATH=\$PATH:/opt/clang/bin/" >> ~/.bashrc
rm clang+llvm-3.5.1-x86_64-linux-gnu.tar.xz
wget http://embed.cs.utah.edu/creduce/creduce-2.2.1.tar.gz
tar xf creduce-2.2.1.tar.gz
cd creduce-2.2.1
./configure
make
sudo make install
cd ..
rm -rf creduce-2.2.1
echo "done!"