source /etc/profile.d/modules.sh
make clean
rm -rf ./../ext/*
./install.sh curl
###./install.sh mpich
####export PATH=$PWD/../ext/MPICH/bin/:$PATH
./install.sh netcdf-netcpp
./install.sh boost
module load scalasca/2.2
./install.sh rhpc
