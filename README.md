# superscripts
<b>CRMScripts for SuperOffice</b>

<b>Overview:</b> 
In certain situations we need to merge two databases, and this routine is ment to automate this process as much as possible. This user guide will assume that both databases are mounted locally and fully functional.

The dbMerge-script must be executed on the source database. The moveAttachment-script can be run on any working installation afterwards. These scripts will generate a SQL script for merging databases, and a batch output for copy/renaming the files in the attachment folder. Please note that SO_ARC (and Customer Center-files) will need to be copied manually. 

<b>This script has been tested successfully on the following versions of SuperOffice: </b><br>
8.5 R10<br>
8.5 R15<br>

<b>What the different scripts do:</b><br>
dbMerge.crmscript         - merges two locally mounted SQL databases<br>
moveAttachments.crmscript - renames and copies files from the attachment-folder<br>
dbPrep.sql                - modifies an online DB to run on a local SQL-server<br>
dbMove.sql                - modifies install-paths, urls and more when moving a DB<br>

<b>Preparation:</b><br>
You will need admin access to both installations, as well as ejsysuser credentials.<br>
Make sure expander services is activated on both databases.<br>
Mount both databases on a local server or image and make sure the installations is fully functional.<br>
Make sure both databases is running the same version of SO.<br>
Right before merging, consider taking a backup of both databases.<br>


<b>Merge database: </b><br> 
Run the dbMerge.crmscript on the source database, adjusting variables as needed. Copy/save the output (SQL query) and run it on the SQL server to merge the databases. This will take some time, and in turn output some bumped values from the sequence-table. Note the value for attachment, as you will be using this in the next step.

<b>Merge files: </b><br> 
Attachments: On the target database load moveAttachments.crmscript, and alter the paths as needed. Insert the attachment value from the previous step. Run it and copy/save the output. The output should be saved as a batch script, meaning you should create a .bat file on the server so that you can run it in order to rename and merge files from the attachment folder.

SO_Arc: All the folders in the source SO_Arc must be renamed to <i>foldername</i>(DB_Merge). This can be done via the command line, using this command: <code><i>for /D %f in (C:\SuperOffice\SO_ARC*) do rename "%f" "%~nxf(DB_Merge)"</i></code><br>
Copy/move SO_ARC manually from source to target destination.

<b>Manual steps:</b><br> 
Every merged user need to have their password reset, and probably their username changed as they will appear with the ‘DB Merge’-tag. 
Most of the merged data will appear with a ‘DB Merge’-tag. This needs to be cleaned up, preferably by the customers data quality responsible. This is time consuming work, and it's recommended that the customer is made aware of this.

<b>Verification after merge:</b><br> 
Appointments; Does appointments show for both an existing user and for a merged user? <br>
Files in sales: Are you able to open a document from and existing entity and a merged one? <br>
Selections: Does imported selections function correctly? <br>
Sales: Are you able to view imported sales and quotes? <br>
Service: Check and see if requests has been imported. <br>
Service: Try to download or view an attachment from an imported request.<br>

<b>Maintaining the script: </b><br> 
With each release there might be modifications done to the table structure, and it will be listed here: https://community.superoffice.com/documentation/SDK/SO.Database/html/WhatsNew-WhatsNew.htm. If this happens, and you discover it first, notify the script maintainer, and/or update the script to include the latest changes. Update this document as well with the latest tested version successfully tested. 

<b>Variables: </b><br> 
Script 1 / Variable 1: <br> 
Script 1 / Variable 2: <br> 
Script 1 / Variable 3: <br> 
Script 2 / Variable 1: <br> 
Script 2 / Variable 2: <br> 
