# forum
The  forum will allow registered users to engage in online discussions and unregistered users to view discussions similar to forums such as Reddit and HackerNews. The goal is to produce a similar type service that allows users to register, post discussions and make replies. The system will be required to support multiple users. Additionally, unregistered users must be able to view the content but will not be able to edit or rely. The forum needs to be updated in real time.


Features implemented→ 
●	Posts on the website include activity date
●	Hot threads/Hot post tracking, posts on the site are shown by either most recent or by the number of upvotes on each post
●	Accessibility for users and admin
●	Use of MySQL for data storage
●	Grouping and display of discussion topics
●	We did not need to implement the bread crumb navigation strategy due to the fact that we have implemented back buttons on each page, the links will change based on which page the user is currently on.
●	Pages are linked through navigation links on the top of the page header
●	Page created for user validation, with hash password function
●	Form entry for user registration created with profile image
●	Navigation links underline when hovered over for navigation through pages on the website
●	Titles of comments highlighted once they have been clicked on
●	Form validation with JavaScript
●	Responsive design implemented throughout each page of the website
●	The site maintains its state-- once the user is logged in they remain logged in
●	User account and information about posts and comments are stored in the database
●	Asynchronous updates implemented through AJAX which was built into our load function through jquery, by reloading the relevant element every 10 seconds, placing the new updates into the JS
●	Appropriate error handling implemented
●	Security for data
●	Server-side scripting
●	Hand-styled layout with contextual menus
●	2-3 column layout
●	Appropriate design principles
●	Fully functional admin page, admins can edit users, posts, and search
●	Collapsable commenting to show or hide comments on posts
●	Posts can only be edited by the author or admins of the site
●	Ability to browse posts without being a registered user
●	The website redirects if the user is not granted access 




#Preliminary Summary of server-side implemented functionality:

●	We did not need to implement the bread crumb navigation strategy due to the fact that we have implemented back buttons on each page, the links will change based on which page the user is currently on.
●	Pages are linked through navigation links on the top of the page header
●	Page created for user validation, with hash password function
●	Form entry for user registration created with profile image
●	Navigation links underline when hovered over for navigation through pages on the website
●	Titles of comments highlighted once they have been clicked on
●	Form validation with JavaScript
●	Responsive design implemented throughout each page of the website
●	The site maintains its state-- once the user is logged in they remain logged in
●	User account and information about posts and comments are stored in the database
●	Asynchronous updates implemented through AJAX which was built into our load function through jquery, by reloading the relevant element every 10 seconds, placing the new updates into the JS
●	Appropriate error handling implemented

#High-level overview →
At a high level, our website works together with many linked components to create full functionality. The website is dynamic. The web server will receive requests from the files in our git hub repository then these files will be retrieved, then sent to the client-side on the browser. Our website deals with a wide variety of functionalities. All the data imputed from users and posts on the website is stored in the tables.ddl folder. In order to run the website on your local machine, you must have apache tomcat installed. Attributes for the site such as email and admin are stored in the ddl table through the access JDBC.jsp folder, which allows editing of the user profile. Posts comments and user info are all retrieved through the server dynamically and stored in the database. Creating an account posting and commenting is all done through the server as well. This is all on the server-side. The code that runs in the browser is all client-side and works to improve the appearance and behavior of the user functionalities of the site. All of the stylings for the site can be found in the CSS folder which is found within the web content.

