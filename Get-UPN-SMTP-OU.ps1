##################################################################################################################################################
###                                                                                                                                            ###
###  	Script by Terry Munro -                                                                                                                ###
###     Technical Blog -               http://365admin.com.au                                                                                  ###
###     Webpage -                      https://www.linkedin.com/in/terry-munro/                                                                ###
###     GitHub Scripts -               https://github.com/TeamTerry                                                                            ###
###                                                                                                                                            ###
###     GitHub Download link -         https://github.com/TeamTerry/Scripts-to-update-UPN-to-match-the-user-s-Primary-SMTP-email-address       ### 
###                                                                                                                                            ###
###     Support -                      http://www.365admin.com.au/2018/02/how-to-update-user-upns-to-match-users.html                          ###
###                                                                                                                                            ###
###     Version 1.0 - 03/02/2018                                                                                                               ### 
###                                                                                                                                            ###
###                                                                                                                                            ###
##################################################################################################################################################

###   Notes

###   Support URL -                      http://www.365admin.com.au/2018/02/how-to-update-user-upns-to-match-users.html

###   Script Use - Get csv report of all users in a specific OU and sub OUs and report of User Principal Name and Primary SMTP Address
###
###   Run this script on a computer with Exchange tools installed
###   This script uses Exchange Management Shell
###
###   Parameters will prompt for input
###   First prompt - OU - Enter the Distinguished Name of the OU

### You can get the DN by opening Active Directory Users and Computers - View - Advanced Features
### Then select the target OU - Properties - Attribute Editor - DistinguishedName ###
### Do not include any quotation marks in the OU Distinguished Name

### Update the variable - $logpath - if you need to save the report to a different location 

param (
    [Parameter(mandatory=$true)]
    [string] $OU
)

$logpath = "c:\reports"

Get-Mailbox -OrganizationalUnit $OU -ResultSize Unlimited | Select DisplayName,Alias,UserPrincipalName,PrimarySMTPAddress | export-csv -NoTypeInformation "$logpath\Users-UPNs-OU.csv" -append