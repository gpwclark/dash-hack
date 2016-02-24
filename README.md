scapy install: http://www.secdev.org/projects/scapy/doc/installation.html

config the vm:
vagrant init ubuntu/wily32                                                                                                
config.vm.provision "shell", path: "init.sh"

# Custom Amazon Dash Ordering Button

With a VM running on a machine that lives on your local network, it is possible
to take any Amazon Dash button you have and make it such that you can order
any amazon product you want. This project uses 
[Ted Benson's python scripts](https://medium.com/@edwardbenson/how-i-hacked-amazon-s-5-wifi-button-to-track-baby-data-794214b0bdd8#.hfdp0wqbq) 
that monitor your network (to determine when the button is pressed), and RaiMan's 
SikuliX (to graphically order an Amazon product). Since Amazon has stepped up
their game and prevented many previous approaches to auto-ordering products 
(python mechanize, the lynx browser, etc.) the most reliable way I found was
to just embrace the GUI. I know you can auto-order with amazon if you have a
vendor account but that is obviously out of scope for most.

## Getting the machine up and running

After cloning the repo you will need to [install vagrant](https://www.vagrantup.com/docs/installation/).

In this guide I will assume you are using the provider Virtual Box so to get the machine up
and running execute 
```
vagrant up --provider virtualbox
```

## Getting the network ready

Unfortunately, vagrant will only work with NAT networking interface card
as the 1st adapter and in order for the python scripts (which use scapy)
to correctly scan your network you have to use a bridged adapter. I tried
provisioning the second adapter in VirtualBox as a bridged adapter in
"allow-all" promiscuous mode while keeping the first adapter set to NAT
but that did not allow the python scripts to see the dash button on the 
LAN (no idea why). Thus, after vagrant up has the machine up and running
you need to open the Virtual Box application, select the machine vagrant
provisioned, go to "Network" and change "NAT" to "Bridged Adapter" for the
first adapter. You must also set "Promiscuous Mode" to "Allow All", this is
probably in "Advanced Settings" depending on what OS and version of VB you
are using.

## Getting the dash-button ready

As outlined in Ted Benson's guide, you must register your dash button
with the amazon app on your phone but stop the configuration at the 
step where it asks you what product you want to use. The dash button
works by connecting to the network when the button is pressed and
then disconnecting. Once you have done these steps you will notice
that if you press the button it will blink white for a while and then
red. Blinking white means it is connecting and the red indicates that 
the button failed to register with amazon (obviously... you never told
amazon what product you were ordering). For us the red is a good sign
because that means that the button connected to the network. The
python scripts just monitor the mac addresses of the devices that connect
to the network so the first thing we have to do is figure out the MAC
address of the amazon dash button you ordered.


Use the Virtual Box interface to open up a window to the running VM and
run the following commands in the terminal (if prompted for login and 
password they both are "vagrant":

```
cd /vagrant/
sudo python dash-listen.py
```

Then click your amazon dash button and the script should spit out the MAC
address. Take that MAC address and hardcode it into the `dash-monitor.py`
script.
