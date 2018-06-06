#! /bin/bash
OUTPUT=keychecker_output.txt

echo -e "\n *********"
echo -e   " * INPUT *"
echo      " *********"

echo -e "\n15 words secret key:"
read MNEMONIC

echo -e "\nEmail:"
read EMAIL

echo -e "\nPassword:"
read PASSWORD

echo -e "\nCurrent Ethereum address:"
read ETH_ADDR

python pykeychecker/keychecker.py $MNEMONIC $EMAIL "$PASSWORD" $ETH_ADDR > $OUTPUT

echo -e "\n\n **********"
echo -e     " * OUTPUT *"
echo        " **********"

echo -e "\nTezos public key hash (a/k/a Tezos address):"
cat $OUTPUT | grep TZL_addr | cut -d ' ' -f2

echo -e "\nCurrent Ethereum address:"
echo $ETH_ADDR

echo -e "\nTezos public key:"
cat $OUTPUT | grep TZL_pk | cut -d ' ' -f2

echo -e "\nCryptographic signature:"
cat $OUTPUT | grep ETH_addrSignature | cut -d ' ' -f2

echo
