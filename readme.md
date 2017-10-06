# Sweet Tooth Recipe Apps

[Start the App](https://pacific-anchorage-41748.herokuapp.com/)

[The User stories](https://github.com/fionajessica23/project2_app/blob/master/user_stories.txt)

[The Wireframe](https://github.com/fionajessica23/project2_app/blob/master/wireframe_and_route_map.zip)

---
### Approach

In building the Sweet Tooth recipe app, I started with doing the wireframe and create user stories to guide me. It does help me with the next step which is to define my database and the relations required among each tables required for this app.

I started out with creating the CRUD for the recipe function with the minimum routing, but then I got lost because the number of routes starting to get bigger. So I paused and made a route mapping table first and also did the skeleton of the website (header, footer and navigation) before progressing further with the functions.

I continued working on each pages, starting from my recipe page (the CRUD recipe functions), homepage and the rest of the pages. After that I worked on the login and create new account function. I continued with working on the validation to ensure that some functions only work for registered users, putting database constraint, Active record validation and also condition in my .rb file.

The last one is I added bookmarking feature for registered users.

---

### Technologies used

* Active record
* PostgreSQL database
* Sinatra
* Sinatra flash
* Sinatra generator
* Sinatra contrib
* PG


---

### Future Features

* Have an option to get the 'Quick n Easy' recipes list displayed
* Enable users to like recipes and to display the recipe with the highest number of likes
* Enable users to suggest new recipes that they want to see in the apps (wish list)
* Enable users to see list of suggested recipes based on the ingredients input from users

---

### Unsolved problems

* If users delete their own recipes that are bookmarked by other users  
