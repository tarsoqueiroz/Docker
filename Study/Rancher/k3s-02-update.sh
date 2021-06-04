echo "*** Updating node0 machine..."
lxc exec node0 -- sudo apt update
lxc exec node0 -- sudo apt upgrade -y
lxc exec node0 -- sudo apt clean
lxc exec node0 -- sudo apt autoclean
lxc exec node0 -- sudo apt autoremove -y

echo "*** Updating node1 machine..."
lxc exec node1 -- sudo apt update
lxc exec node1 -- sudo apt upgrade -y
lxc exec node1 -- sudo apt clean
lxc exec node1 -- sudo apt autoclean
lxc exec node1 -- sudo apt autoremove -y

echo "*** Updating node2 machine..."
lxc exec node2 -- sudo apt update
lxc exec node2 -- sudo apt upgrade -y
lxc exec node2 -- sudo apt clean
lxc exec node2 -- sudo apt autoclean
lxc exec node2 -- sudo apt autoremove -y
