
echo "------------------------------------------DDR info-------------------------------------" >> results

sudo dmidecode -t memory |grep Speed >> results

echo "------------------------------------------CPU info-------------------------------------" >> results

sudo dmesg |grep CPU |grep family >> results
sudo dmesg |grep processor |grep MHz >> results



