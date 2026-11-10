# Script: tong_hop.ps1
# Tac gia: THANH THAO
# Ngay tao: THANH THAO
write-host "dang tao bao cao..." 
"=== BAO CAO SU CO WEBSITE ===" > tong_hop.txt
Get-content ./access.log | select-string "status=404" >> tong_hop.txt
GET-CONTENT ./access.log | select-string "status=500" | measure-object >> tong_hop.txt
write-host "hoan thanh!!!" 
