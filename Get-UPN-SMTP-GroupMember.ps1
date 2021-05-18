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

###   Script Use - Get csv report of all users in a specific Group and report of User Principal Name and Primary SMTP Address
###
###   Run this script on a computer with Exchange tools installed
###   This script uses Exchange Management Shell
###
###   Parameters will prompt for input
###   First prompt - GroupName - Enter the Name of the Group 
###   Note - Group type must be a DL or email enabled security group


### Update the variable - $logpath - if you need to save the report to a different location

param (
    [Parameter(mandatory=$true)]
    [string] $GroupName
)

$logpath = "c:\reports"


Get-DistributionGroupMember -Identity $GroupName | Select Name,Alias | export-csv -NoTypeInformation "$logpath\Mailboxes.csv"

Start-Sleep -Seconds 30

Import-CSV "$logpath\Mailboxes.csv" |
foreach {Get-Mailbox -id $_.Alias} | Select DisplayName,Alias,PrimarySMTPAddress,UserPrincipalName | export-csv -NoTypeInformation "$logpath\Users-UPNs-Group.csv" -append
