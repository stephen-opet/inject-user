# Create a new WordPress Admin User with SQL 

This simple bash script automatically generates the necessary SQL queries to create WordPress admin user. Over the course of my career, I've had many instances where a client has given us hosting access, but has failed to provide valid WordPress backend credentials. This tool has saved me countless hours of frustrating client conversations by creating a new WP user through the hosting access!

Simply download both the userScript.sh file and the sql.txt file. I recommend updating some of the initial values in the sql.txt file to better represent you - i.e. change the username, email, and URL. Save these two files in a dedicated directory on your desktop.

Next, use the site's hosting access to download the wp-config.php file. This information file provides WordPress with important information regarding the authorized mySQL user and table prefixes. Place this wp-config.php file in the same directory as sql.txt and userScript.sh.

Then, open the directory in bash and run the script:
  $sudo ./userScript.sh
  
A 16 digit string will be printed to the screen - this will be your user's new password. Make a record of this password, alongside the username you preset in sql.txt.

At this point, the text in sql.txt should have updated - it is now customized for your particular WordPress installation. You can simply copy the entirety of this file, and run it as an SQL query (for most hosts with cPanel, this can be found through PHPMyAdmin). Once you run this SQL, your new username and password should log you in as an admin user through the WP backend. 

* The data in sql.txt is rewritten every time the script is run. This file will need to be manually restored for subsequent executions. Future versions of this script could preserve sql.txt, and generate the relevant SQL data in a new file. 

** The SQL in this script creates a new user with an MD5 encrypted password. MD5 protocols are considered insecure at the time of this publication. WordPress will automatically update this MD5 pw with a more secure hash upon the first successful login, thus eliminating any security vulnerability. But make sure to successfully log in shortly after running your SQL to remove this MD5 hash
