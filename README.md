# **forum**

# viewable @ forum.laizone.net:8080/forum

The  forum will allow registered users to engage in online discussions and unregistered users to view discussions similar to forums such as Reddit and HackerNews. The goal is to produce a similar type service that allows users to register, post discussions and make replies. The system will be required to support multiple users. Additionally, unregistered users must be able to view the content but will not be able to edit or rely. The forum needs to be updated in real time.


## Features implemented

●	Posts on the website include activity date <br/>
●	Hot threads/Hot post tracking, posts on the site are shown by either most recent or by the number of upvotes on each post <br/>
●	Accessibility for users and admin <br/>
●	Use of MySQL for data storage <br/>
●	Grouping and display of discussion topics <br/>
●	We did not need to implement the bread crumb navigation strategy due to the fact that we have implemented back buttons on each page, the links will change based on which page the user is currently on. <br/> 
●	Pages are linked through navigation links on the top of the page header <br/>
●	Page created for user validation, with hash password function <br/>
●	Form entry for user registration created with profile image <br/>
●	Navigation links underline when hovered over for navigation through pages on the website <br/>
●	Titles of comments highlighted once they have been clicked on <br/>
●	Form validation with JavaScript <br/>
●	Responsive design implemented throughout each page of the website <br/>
●	The site maintains its state-- once the user is logged in they remain logged in <br/>
●	User account and information about posts and comments are stored in the database <br/>
●	Asynchronous updates implemented through AJAX which was built into our load function through jquery, by reloading the relevant element every 10 seconds, placing the new updates into the JS <br/> 
●	Appropriate error handling implemented <br/>
●	Security for data <br/> 
●	Server-side scripting <br/>
●	Hand-styled layout with contextual menus <br/>
●	2-3 column layout <br/>
●	Appropriate design principles <br/>
●	Fully functional admin page, admins can edit users, posts, and search <br/>
●	Collapsable commenting to show or hide comments on posts <br/>
●	Posts can only be edited by the author or admins of the site <br/>
●	Ability to browse posts without being a registered user <br/>
●	The website redirects if the user is not granted access  <br/>




## Preliminary Summary of server-side implemented functionality:

●	We did not need to implement the bread crumb navigation strategy due to the fact that we have implemented back buttons on each page, the links will change based on which page the user is currently on. <br/>
●	Pages are linked through navigation links on the top of the page header <br/>
●	Page created for user validation, with hash password function <br/> 
●	Form entry for user registration created with profile image <br/>
●	Navigation links underline when hovered over for navigation through pages on the website <br/>
●	Titles of comments highlighted once they have been clicked on <br/>
●	Form validation with JavaScript <br/>
●	Responsive design implemented throughout each page of the website <br/>
●	The site maintains its state-- once the user is logged in they remain logged in <br/>
●	User account and information about posts and comments are stored in the database <br/>
●	Asynchronous updates implemented through AJAX which was built into our load function through jquery, by reloading the relevant element every 10 seconds, placing the new updates into the JS <br/>
●	Appropriate error handling implemented <br/>

 ## High-level overview
 
At a high level, our website works together with many linked components to create full functionality. The website is dynamic. The web server will receive requests from the files in our git hub repository then these files will be retrieved, then sent to the client-side on the browser. Our website deals with a wide variety of functionalities. All the data imputed from users and posts on the website is stored in the tables.ddl folder. In order to run the website on your local machine, you must have apache tomcat installed. Attributes for the site such as email and admin are stored in the ddl table through the access JDBC.jsp folder, which allows editing of the user profile. Posts comments and user info are all retrieved through the server dynamically and stored in the database. Creating an account posting and commenting is all done through the server as well. This is all on the server-side. The code that runs in the browser is all client-side and works to improve the appearance and behavior of the user functionalities of the site. All of the stylings for the site can be found in the CSS folder which is found within the web content.

