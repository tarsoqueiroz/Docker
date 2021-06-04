echo "*** Creating node0 machine..."
lxc launch ubuntu:20.04 node0 --profile default
sleep 5
lxc exec node0 -- sudo apt update
lxc exec node0 -- sudo apt upgrade -y
lxc exec node0 -- sudo apt clean
lxc exec node0 -- sudo apt autoclean
lxc exec node0 -- sudo apt autoremove -y

echo "*** Creating node1 machine..."
lxc launch ubuntu:20.04 node1 --profile default
sleep 5
lxc exec node1 -- sudo apt update
lxc exec node1 -- sudo apt upgrade -y
lxc exec node1 -- sudo apt clean
lxc exec node1 -- sudo apt autoclean
lxc exec node1 -- sudo apt autoremove -y

echo "*** Creating node2 machine..."
lxc launch ubuntu:20.04 node2 --profile default
sleep 5
lxc exec node2 -- sudo apt update
lxc exec node2 -- sudo apt upgrade -y
lxc exec node2 -- sudo apt clean
lxc exec node2 -- sudo apt autoclean
lxc exec node2 -- sudo apt autoremove -y
