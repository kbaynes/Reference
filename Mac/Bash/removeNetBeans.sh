# Removes NetBeans installation from Mac
# kbaynes
# Nov 2018
# Works with NB 8

# The Lesson: Install NetBeans with HomeBrew!

# Call this script as Root
# sudo removeNetBeans.sh

rm -rfv ~/Application/Netbeans
rm -rfv ~/Library/Application\ Support/NetBeans/
rm -rfv ~/Library/Caches/NetBeans/
rm -rfv /private/var/db/receipts/org.netbeans.*
