if [ -f "./results" ]; then
	mv results results.bak;
fi


echo "----------------------------------------Vivado info-------------------------------------" >> results

vivado -version >> results



