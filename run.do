
vsim +access+r full_adder_tb 


run -all


acdb save -o coverage.acdb
acdb report -db coverage.acdb -txt -o cov_report.txt


exec cat cov_report.txt