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
###   Script Use - Used to update a single AD User's UPN to the primary SMTP address that you specify
###
###   Run this script on a computer with RSAT tools installed
###   This script uses Active Directory PowerShell
###
###   Parameters will prompt for input
###   First prompt - Alias - enter the alias of the Active Directory User object that you are updating the UserPrincipalName fo
###   Second prompt - UserPrincipalName - enter the full email address for the Active Directory user object that you are updating the UPN for


param (
    [Parameter(mandatory=$true)]
    [string] $alias,
    [Parameter(mandatory=$true)]
    [string] $UserPrincipalName
)

Import-Module ActiveDirectory

get-aduser -identity $alias | set-aduser -UserPrincipalName $UserPrincipalName