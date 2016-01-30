# FPGA-Homwork
## Introdution
## Quartus Linux Bug
on ubuntu 14.04 and upper quartus 14.1 exit unexpectedly in order to fix
this issue I use following commands in `altera/14.1/quartus/linux64` directory:
```
mv libcurl.so.4 libcurl.so.4.bak
mv libssl.so.1.0.0 libssl.so.1.0.0.bak
mv libcrypto.so.1.0.0 libcrypto.so.1.0.0.bak
```
