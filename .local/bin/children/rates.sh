echo "Enter the coin/crypto you want to look at (input nothing for overall, ':help' for help, and '@' for time specifications ie 'btc@4w')"
read
curl rate.sx/$REPLY
read
