/* Run when installation is moved or the domain name is changed. */

DECLARE @path varchar(199),@url varchar(199),@oldurl varchar(199) 
SET @path = '' 
SET @url = '' 
SET @oldurl = '' 

--UPDATE CONFIG 
update crm7.config set  
                text_path = @path + '\text' 
                ,attachment_path = @path + '\attachments' 
                ,template_path = @path + '\templates' 
                ,cgi_bin = '/service/scripts' 
                ,cgi_url = @url 
                ,warning = @path + '\log\warning' 
                ,cgi_url_internal = @url 
    where 
                id = 1 

--UPDATE REGISTRY 
update crm7.REGISTRY set value = @path + '\bin\ejSender.exe' where reg_id = 1 
update crm7.REGISTRY set value = @path + '\bin\ejOutbox.exe' where reg_id = 22 
update crm7.REGISTRY set value = @path + '\bin\dbi.exe' where reg_id = 131 
update crm7.REGISTRY set value = @path + '\bin\NetServerGetTicketWcf.exe' where reg_id = 245 
update crm7.REGISTRY set value = @path + '\bin\ejImageResizer.exe' where reg_id = 284 
update crm7.REGISTRY set value = @path + '\log' where reg_id = 40 
update crm7.REGISTRY set value = '/service/' where reg_id = 109 

--OTHER TABLES 
update crm7.s_message set html_message = replace(html_message,@oldurl ,@url) where html_message like '%'+@oldurl+'%' 
update crm7.ej_message set html_body = replace(html_body,@oldurl ,@url) where html_body like '%'+@oldurl+'%' 
update crm7.ej_message set body = replace(body,@oldurl ,@url) where body like '%'+@oldurl+'%' 
update crm7.reply_template_body set body_html = replace(body_html,@oldurl ,@url) where body_html like '%'+@oldurl+'%' 
update crm7.ejuser set signature = replace(signature,@oldurl ,@url) where signature like '%'+@oldurl+'%' 
update crm7.ejscript set body = replace(body,@oldurl ,@url) where body like '%'+@oldurl+'%' 
update crm7.screen_definition_action set ejscript_body = replace(ejscript_body,@oldurl ,@url) where ejscript_body like '%'+@oldurl+'%' 

--UPDATE ATTACHMENT_LOCATION 
update crm7.attachment_location set path = @path + '\attachments' where attachment_location_id = 1 
