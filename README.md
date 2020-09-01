# superscripts
<b>CRMScripts for SuperOffice</b>

<b>Overview:</b> 
In certain situations we need to merge two databases, and this routine is ment to automate this process as much as possible. This user guide will assume that both databases are mounted locally and fully functional.

The dbMerge-script must be executed on the ‘slave’ database. The moveAttachment-script can be run on any working installation afterwards. These scripts will generate a SQL script for merging databases, and a batch output for copy/renaming the files in the attachment folder. Please note that SO_ARC (and Customer Center-files) will need to be copied manually. 

<b>This script has been tested successfully on the following versions of SuperOffice: </b><br>
8.5 R10<br>
8.5 R15<br>

<b>What the different scripts do:</b><br>
dbMerge.crmscript         - merges two locally mounted SQL databases<br>
moveAttachments.crmscript - renames and copies files from the attachment-folder<br>
dbPrep.sql                - modifies an online DB to run on a local SQL-server<br>
dbMove.sql                - modifies install-paths, urls and more when moving a DB<br>

<b>Preparation:</b><br> 
Make sure expander services is activated on both databases <br>
Optional: Create a test-environment mirroring the customers production systems. <br>
Make sure the source and target databases is running the same version of SO.  <br>
Make a note of the naming scheme of the target database, as well choosing a name for the source database one mounted/restored in SQL Server. <br>
File locations once placed on server (Attachment folder) <br>
Admin access and expander services on slave database <br>
Admin access on master database <br>

Run the scripts on the source database, and as quickly as possible create and download a backup that will be used for merging. This method will allow you to merge the databases without requiring the ejsysuser-password for the source database. 

<b>Merge database: </b><br> 
Log on to slave database and prepare to run CRM Script. Copy and paste ‘script1’ to CS and alter the variables as needed. Run it and copy/save the output. The output is saved as a SQL script. 

On the same slave database, copy and paste ‘script 2’ to cs, and alter the variables as needed. Run it and copy/save the output. The output is saved as batch script, meaning you should create a .bat file on the target server so that you can run it to rename and copy files from the attachment folder. 

<b>Merge files: </b><br> 
The ID bump will be visible in the result after merging databases. Alternatively you can input the next_id column from the sequence table (tablename attachment) 
Run the batch script generated in the previous step 
Copy/move SO_ARC manually from source to target destination 

<b>Manual steps:</b><br> 
Every merged user needs to have their password reset, and probably their username changed as they will appear with the ‘DB Merge’-tag. 
Most of the merged data will appear with a ‘DB Merge’-tag. This needs to be cleaned up, preferably by the customers data quality responsible. 

<b>Verification after merge:</b><br> 
<i>Log into SuperOffice, and check: <br>
Appointments; Does appointments show for both an existing user and for a merged user? <br>
Files in sales: Are you able to open a document from and existing entity and a merged one? <br>
Selections: Does imported selections function correctly? <br>
Sales: Are you able to view imported sales? <br>
Service: Check and see if requests has been imported. <br>
Service: Try to download or view an attachment from an imported request. </i><br>

<b>Possible issues: </b><br> 
Here you should make a note of issues encountered (if any) and how they where corrected. Yes, you. 
If the databases share custom table names, then the outcome of the merging of these are currently unknown. 

<b>Maintaining the script: </b><br> 
With each release there might be modifications done to the table structure, and it will be listed here: https://community.superoffice.com/documentation/SDK/SO.Database/html/WhatsNew-WhatsNew.htm. If this happens, and you discover it first, notify the script maintainer, and/or update the script to include the latest changes. Update this document as well with the latest tested version successfully tested. 

<b>Variables: </b><br> 
Script 1 / Variable 1: <br> 
Script 1 / Variable 2: <br> 
Script 1 / Variable 3: <br> 
Script 2 / Variable 1: <br> 
Script 2 / Variable 2: <br> 
