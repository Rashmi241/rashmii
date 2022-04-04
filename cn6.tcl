# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   10.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile

#===================================
#        Nodes Definition        
#===================================
#Create 5 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#===================================
#        Links Definition        
#===================================
#Createlinks between nodes
$ns duplex-link $n0 $n4 1Mb 10ms DropTail
$ns queue-limit $n0 $n4 50
$ns duplex-link $n4 $n3 1Mb 10ms DropTail
$ns queue-limit $n4 $n3 50
$ns duplex-link $n1 $n4 1Mb 10ms DropTail
$ns queue-limit $n1 $n4 50
$ns duplex-link $n4 $n2 1Mb 10ms DropTail
$ns queue-limit $n4 $n2 50

#Give node position (for NAM)
$ns duplex-link-op $n0 $n4 orient right-down
$ns duplex-link-op $n4 $n3 orient right-down
$ns duplex-link-op $n1 $n4 orient left-down
$ns duplex-link-op $n4 $n2 orient left-down

set tcp [new Agent/TCP]      
ns attach-agent $n0 $tcp        

set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink
$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

set udp [new Agent/UDP]
$ns  attach-agent $n1 $udp 

set null [new Agent/Null]
$ns attach-agent $n2 $null
$ns connect $udp $null

$udp set class_ 1
$ns color 1 Blue

$tcp set class_ 2
$ns color 2 Red

set cbr [new Application/Traffic/CBR]
$cbr set packetsize_ 500
$cbr set interval_ 0.005
$cbr attach-agent $udp

$ns at 0.0 "$cbr start"
$ns at 0.0 "$ftp start"
$ns at 9.0 "$cbr stop"
$ns at 9.0 "$ftp stop"


#===================================

#=================================== 
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

