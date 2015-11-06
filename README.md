Project 	- CMSGears (http://www.cmsgears.org)

Template  	- Blog

License 	- GPLv3 (http://www.gnu.org/licenses/gpl-3.0.html)

Description - The blog template requires below listed modules, plugins, themes and widgets freely provided by CMSGears.

Modules
------------------------------------------
1. Core Module to manage site users, galleries, newsletters, roles and permissions.
2. Forms Module to accept forms in both ajax and regular way.

Plugins
------------------------------------------
1. File Manager Plugin provide default component to accept uploaded files and File Uploader Widget to uploads files.

Widgets
------------------------------------------
1. CLEditor Widget can be used to edit content using CLEditor WYSIWYG editor.
2. Gallery Widget can be used to show Image Galleries.
3. Login Widget can be used to login or register on site using Ajax.
4. Nav Widget can be used to form navigation menus.
5. Newsletter Widget can be used to allow site users to register for news and updates from site.
6. Blog Widget can be used to show blog posts.

Themes
------------------------------------------
1. Blog Theme for frontend. It provide layouts and views for Core, Forms and CMS modules.
2. Admin Theme provide layouts to manage Core, Forms and CMS modules.

Template Details
=========================================
The Blog Template is a group of directories and configuration files used to manage the backend and frontend applications. 

It also provide DB configuration having required test data. The uploads directory is uploaded by default gallery used on landing page.

Template Demo
=========================================
1. Frontend - http://demo.cmsgears.com/templates/blog (demouser@cmsgears.com, test#123)
2. Admin - http://demo.cmsgears.com/templates/blog/admin (demomaster@cmsgears.com, test#123)

Template Installation
=========================================

The Blog Template can be installed via composer using the below mentioned command. To install composer, please refer to their official site https://getcomposer.org.

```
php composer.phar create-project --prefer-dist --stability=stable cmsgears/template-blog cmgdemoblog

or

composer create-project --prefer-dist --stability=stable cmsgears/template-blog cmgdemoblog

We can also use below mentioned commands to access the pre release code

php composer.phar create-project --prefer-dist --stability=<alpha or beta or RC> cmsgears/template-blog cmgdemoblog

or

composer create-project --prefer-dist --stability=<alpha or beta or RC> cmsgears/template-blog cmgdemoblog
```

If we are using Apache web server, we need to run either of the above mentioned command under Apache web root directory. More details can be found at http://www.cmsgears.org.

Template Configuration - New
=========================================

1. Create the database, database user and update both the environments config - environments/dev/common/config/config-env.php, environments/prod/common/config/config-env.php. The default database and database user are cmgdemoblog.
2. To trigger real-time mails in production environment, remove the config param 'useFileTransport' from the environments/prod/common/config/config-env.php.
3. Install the DB using all-in-one-d.sql provided within the console/migrations directory. We might need to change database name if it's different than cmgdemoblog.
4. Run the php script init.php to initialize the application for the predefined environments. The script will ask to choose environemnt among prod or dev.
5. Update htaccess located under template root based on your web server needs. More details about live application settings can be found at http://www.cmsgears.org.
6. Download the Admin and Blog Themes and place them under <template root>/themes/admin and <template root>/themes/blog directories respectively. 
7. Now we can run the template using our preferred browser. Example links are as mentioned below.

```
Frontend - http://localhost/cmgdemoblog/frontend/web
Admin - http://localhost/cmgdemoblog/frontend/web
```

Template Configuration - Update
=========================================

We can update the dependencies using composer.json file located at the root of template. Once done the standard composer command can be used to update dependencies.

Default Pages
=========================================

The Blog Theme installed for Blog Template provide views for default system and blog pages as listed below.

1. Landing
2. Login
3. Register
4. Forgot Password
5. Reset Password
6. User Home
7. User Profile
8. User Settings
9. Blog
10. Blog Post