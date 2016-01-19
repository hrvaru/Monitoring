#/bin/bash
clear
chmod +x $0
Hard_or_Soft_Link ()
{
	clear
	echo "Check number of linked files in the current directory"
	find . -type l
}

Hardware_details ()
{
	clear
	echo "\n Hardware_details are"
	inxi
}

OS_details () 
{
	clear
	echo "\n\t System details are:"
	echo "\n\t Your Architecture is:\c"
	uname -m
	echo "\n OS name and its version is:"
	lsb_release -a | tail -n 3
}

Networking_details ()
{
	clear
	echo "\n Internal or machine IP-address is: "
	hostname -I | cut -f1 -d" "
	echo "\n External(ISP) IP address is: "
	curl -s ipecho.net/plain;echo
}

System_Details ()
{
      clear 
      while [ 0 ];
      do
	echo "\nSystem Details Menu\n"       
	echo "\n\033[1mSelect the details"
	echo "\n a]Hardware details"
	echo "\n b]OS details"
	echo "\n c]Networking details\033[0m"
	read details
        case $details in
        a) Hardware_details
           ;;
        b) OS_details
           ;;
        c) Networking_details
           ;;
        esac

        echo "\nDo you still want to continue ?: [ yes | no ]"
        echo "\n Press yes to continue and no to go back to main menu"
        read respo
        if [ $respo = y -o $respo = Y -o $respo = Yes -o $respo = YES -o $respo = yes ]; then
           System_Details
        else
           menu
        fi
       done
}

Install_Package ()
{
	clear
	echo "\n Tell the name of the package to install"
	read pack
	dpkg --get-selections | grep $pack > /dev/null
	if [ $? -eq 0 ]; then
	echo "\nPackage is already installed"
	else
	echo "\n Do you want to install package?: [ y | n ]"
	read z
	if [ $z = y ]
	then 
	apt-get install -y $pack
	else 
	System_Details
	fi
	fi
}
	
LSOF ()
{
	echo "\n Find out the process running in background"
	echo "\n Provide processname"
	read A
	lsof | grep $A | head -n 10
}

NETSTAT ()
{
	echo "\n PID of all the processes currently executed by USER"
	netstat 
}

SAR ()
{
	echo "\n Monitors overall system activity"
	sar
}

Running_Processes ()
{
	clear
	while [ 0 ];
	do
	echo "\n Select the command to find PID"
	echo "\n1) LSOF"
	echo "\n2) NETSTAT"
	echo "\n3) SAR"
	echo "\n Select"
	read select
	case $select in
	1) LSOF
	  ;;
	2) NETSTAT
	  ;;
	3) SAR
	  ;;
	esac
	echo "\nDo you still want to continue ?: [ yes | no ]"
        echo "\n Press yes to continue and no to go back to main menu"
        read res
        if [ $res = y -o $res = Y -o $res = Yes -o $res = YES -o $res = yes ]; then
         Running_Processes
        else
           menu
        fi
       done

}
	
response ()
{
	echo "\nDo you still want to continue ?: [ y | n ]"
	echo "\n Press y to continue and n to exit"
	read resp
	if [ $resp = N -o $resp = n -o $resp = No -o $resp = nO -o $resp = NO ]
	then
	echo "Exiting from the script....Bye!!!"
	exit
	else
	continue
	fi 
}

menu ()
{
	echo "\n Select the number on which you want to perform Operation"
	echo "\n\033[1m1] Hard_or_Soft_Link"
	echo "\n2] System_Details"
	echo "\n3] Package Installation"
	echo "\n4] Running_Processes"
	echo "\n5] Exit"
	echo "\nSelect the Operation\033[0m"
	read name
	case $name in
	1) Hard_or_Soft_Link
   	response 
   	;;
	2) System_Details
  	response 
   	;;
	3) Install_Package
  	response 
   	;;
	4) Running_Processes
   	response 
	;;
	5) exit
	  response
	  ;;
	*) echo "\n Wrong choice entered"
   	response
   	;;
	esac  
}
 while [ 0 ];
do
 	menu
	response
done
