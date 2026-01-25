⚠️ Windows Network Lab Switcher

A simple and effective tool (.bat) for rapidly switching network configurations on Windows.

This project was created to automate workflows in laboratory environments that require frequent transitions between a home network (Wi-Fi + DHCP) and an isolated local network via cable (Static IP + Switch), which requires specific firewall settings.

⚠️ Features

The tool consists of two scripts performing opposite tasks:
1. Lab Mode (LAB_ON.bat)

Prepares the computer for work in an isolated network (e.g., connected via a switch without a router):

    Forces Administrator privileges.

    Disables the Wi-Fi adapter to avoid routing conflicts and "double gateway" issues.

    Sets a static IP address on the Ethernet adapter (default: 192.168.1.10 or 192.168.1.11).

    Disables Windows Firewall for the Public network profile.

    Goal: To enable PING and communication within a network that Windows defaults to blocking as "Unidentified/Public".

2. Internet/Home Mode (LAB_OFF.bat)

Restores settings for daily use:

    Enables the Wi-Fi adapter.

    Restores DHCP (automatic IP assignment) on the Ethernet adapter.

    Re-enables Windows Firewall for public networks (for security).

⚠️ Configuration & Customization

Before the first use, you must adapt the scripts to your specific hardware.

How to edit?

    Right-click on the .bat file.

    Select Edit (or "Open with" -> Notepad).

What needs to be changed? In both files, locate the lines responsible for the interface name and IP address.
1. Network Interface Name

Windows assigns various names to network adapters (e.g., "Ethernet", "Ethernet 2", "Local Area Connection"). 
Check your specific name in Control Panel -> Network Connections and replace it in the script:


Example of changing the name from "Ethernet" to "Ethernet 2"
netsh interface ip set address name="Ethernet 2"

⚠️ Warning

The LAB_START.bat script disables the Windows Firewall for the public profile.

    Use this mode only in a trusted local network (e.g., your own disconnected switch).

    Remember to always run LAB_OFF.bat after finishing your work to restore protection before 
    
    reconnecting to public Wi-Fi or the Internet.

⚠️ Requirements

    Operating System: Windows 10 / 11

    Permissions: Administrator privileges (the script will request them automatically).


