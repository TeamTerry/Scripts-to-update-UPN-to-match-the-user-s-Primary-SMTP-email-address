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

###   Script Use - Update UPN to match the Primary SMTP Address targeting users in a specific OU or sub OU
###
###   Run this script on a computer with RSAT tools installed
###   This script uses Active Directory PowerShell
###
###   Parameters will prompt for input
###   First prompt - OU - Enter the Distinguished Name of the OU

### You can get the DN by opening Active Directory Users and Computers - View - Advanced Features
### Then select the target OU - Properties - Attribute Editor - DistinguishedName ###
### Do not include any quotation marks in the OU Distinguished Name 


param (
    [Parameter(mandatory=$true)]
    [string] $OU
)



Import-Module ActiveDirectory



foreach ($user in (Get-ADUser -Filter * -SearchBase $OU)) {

$userdetails = $user | get-aduser -properties *
$user | set-aduser -UserPrincipalName $userdetails.EmailAddress


}