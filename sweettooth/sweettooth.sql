DROP TABLE recipes;
DROP TABLE users;
DROP TABLE categories;
-- DROP TABLE likes;


CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  password_digest VARCHAR (400) NOT NULL
);



CREATE TABLE categories (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  image VARCHAR(400)
);


CREATE TABLE recipes (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  image VARCHAR(400),
  prep_time INTEGER,
  difficulty VARCHAR(200),
  serving VARCHAR(200),
  content TEXT NOT NULL,

  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),

  category_id INTEGER NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories (id)
);


-- CREATE TABLE likes (
--   id SERIAL4 PRIMARY KEY,
--   user_id INTEGER NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES users (id),
--
--   recipe_id INTEGER NOT NULL,
--   FOREIGN KEY (recipe_id) REFERENCES recipes (id)
-- );

INSERT INTO users (name, email, password_digest) VALUES ('fiona', 'fj@ga.com', '$2a$10$5Kk4daZs.pP7YoA4RCLp5.f7.bTQj3byZ0u3isVaV.IDSQz53eOgq');
INSERT INTO users (name, email, password_digest) VALUES ('arya', 'al@ga.com', '$2a$10$5Kk4daZs.pP7YoA4RCLp5.f7.bTQj3byZ0u3isVaV.IDSQz53eOgq');


INSERT INTO categories (name, image) VALUES ('cake', 'https://truffle-assets.imgix.net/c0f9e8b5-emily-515-strawberry-lemonade-icebox-cake-thumbnail-square.png');
INSERT INTO categories (name, image) VALUES ('ice cream', 'http://www.30abikerentalsandicecream.com/wp-content/uploads/2015/04/Ice-Cream-on-30a.jpg');
INSERT INTO categories (name, image) VALUES ('drink', 'https://s.thestreet.com/files/tsc/v2008/photos/all-pics/food/LemonDropMartini-insidelarge.jpg');


INSERT INTO recipes (title, image, prep_time, difficulty, serving, content, user_id, category_id) VALUES ('Cheesecake', 'https://www.cookipedia.co.uk/wiki/images/thumb/5/55/Easy_Philadelphia_cheesecake.jpg/300px-Easy_Philadelphia_cheesecake.jpg', 80, 'easy', 'serves 8', '125 g digestive biscuits crumbs
40 g butter, melted
250 g Philadelphia Original
397 g can condensed milk
120 ml fresh lemon juice, approx 3 lemons
200 mixed summer fruits e.g. strawberries, raspberries, blueberries
Method
Combine the biscuit crumbs and melted butter and press into the base of an 18 cm loose bottomed cake tin and chill whilst preparing the filling.
Whisk together the Philly and condensed milk. Then stir in the lemon juice until mixed. Pour over the prepared base and chill for at least 1 hour until set.
Decorate with the summer fruits.
Variations
The summer fruits could be replaced with a mixture of prepared tropical fruits e.g. kiwi, pineapple, mango and passion fruit.', 1, 1);

INSERT INTO recipes (title, image, prep_time, difficulty, serving, content, user_id, category_id) VALUES ('Matcha Chantilly Cake', 'http://1.bp.blogspot.com/-dVKZIOn7L8g/VSrjpzVLAWI/AAAAAAAATUI/9GMNmeDytmI/s1600/matcha%2Bchantilly%2Bcakes.jpg', 60, 'medium', 'serves 6', 'This recipe requires the use of six 3-inch pastry rings.

12 round tea biscuits (I like McVities)
2 tablespoons matcha tea powder, plus extra for dusting
3 tablespoons boiling hot water
3 tablespoons cool water
.25 ounce (1 package) powdered unflavored gelatin
3 cups heavy whipping cream, divided
1 1/4 cup confectioners’ sugar, divided
1 1/2 pints fresh raspberries
12 matcha cream Pocky sticks

Cover a large baking sheet with parchment paper. Place six 3-inch pastry rings on the paper and line them with acetate. Place a tea biscuit in the center of each ring, reserve the remaining 6 biscuits for later use.

Sift the matcha tea powder into a small bowl; add the boiling hot water and stir until a smooth paste forms.

Place the 3 tablespoons cool water in a separate small microwavable bowl. Evenly sprinkle the package of powdered gelatin over the surface and let it stand for 3 minutes.

In a large bowl, combine 2 cups of the heavy whipping cream and 1 cup of confectioners’ sugar. Beat with an electric mixer on high speed until slightly thickened. Microwave the gelatin mixture for 10 seconds, or until liquid. Beat the cream again on high speed while gradually adding the liquid gelatin into the mixture. When the mixture holds soft peaks add in the matcha paste. Beat until the cream is consistently green and holds stiff peaks. Transfer the cream to a large piping bag and pipe it over the tea biscuits in the pastry rings. Just pipe enough into the rings to cover the cookie completely. Line the outside edge of the rings with raspberries, pointed end-up and so that the raspberries are touching the acetate. Pipe more matcha cream over the raspberries, filling the pastry rings to the top. Refrigerate the cream cakes until set, about 2 hours.

Slide the pastry rings off the cakes and gently peel away the acetate. Top the cakes with the remaining tea biscuits. Return the cakes to the refrigerator.

Combine the 1 cup remaining heavy cream and remaining 1/4 cup confectioners’ sugar in a medium bowl. Beat on high speed until the cream holds stiff peaks. Transfer the whipped cream to a piping bag fitted with a large star decorator tip. Pipe the cream in large swirls on top of the cakes. Garnish the cakes with a raspberry and two matcha cream Pocky sticks, placed crosswise beside the berry.
If you love the deliciously bitter flavor of pure matcha powder, then sift a little over each cake before serving.

Keep leftover cakes refrigerated.', 2, 1);


INSERT INTO recipes (title, image, prep_time, difficulty, serving, content, user_id, category_id) VALUES ('Green Tea Ice Cream', 'https://www.justonecookbook.com/wp-content/uploads/2014/03/Green-Tea-Ice-Cream.jpg', 30, 'medium', 'serves 4', 'Ingredients
2 cups Half & Half (480 ml) (or 1 cup (240 ml) whole milk + 1 cup (240 ml) heavy (whipping) cream (butterfat 36-38%), See Notes)
3 Tbsp matcha (green tea powder) (3 Tbsp = 18 g)
½ cup granulated sugar (½ cup = about 100 g)
Pinch Kosher salt (about 1/16 tsp)
Instructions
1. Freeze the ice cream bowl for 24 hours.
Gather all the ingredients.
2. In a medium saucepan, whisk together the half and half, sugar and salt.
3. Start cooking the mixture over medium heat, and add green tea powder. Stir often and cook until the mixture starts to foam and is very hot to the touch but not boiling.
4. Remove from the heat and transfer the mixture to a bowl sitting in an ice bath. When the mixture is cool, cover with plastic wrap and chill in the refrigerator for 2-3 hours.
5. Once the mixture is thoroughly chilled, transfer to a pre-chilled ice cream maker and churn according to the manufacture instructions (20-25 minutes).
Transfer the soft ice cream into an airtight container and freeze for at least 3 hours before serving.', 1, 2);


INSERT INTO recipes (title, image, prep_time, difficulty, serving, content, user_id, category_id) VALUES ('Blueberry Ice Cream', 'https://www.bakedbyrachel.com/wp-content/uploads/2015/08/blueberryicecream3_bakedbyrachel.jpg', 20, 'easy', 'serves 6', 'Ingredients:

2C blueberries, fresh or frozen
1C granulated sugar, divided
1Tb lemon juice
2C heavy cream
1C whole milk
1/4 tsp salt
1/2 tsp vanilla extract
3 egg yolks
Directions:

1. Combine 1/4 cup sugar, blueberries and lemon juice in a small saucepan set over medium heat. Bring to a boil and mash berries. Puree blueberry mixture, then strain through a fine mesh strainer. Set aside.
2. Add 1 cup heavy cream and vanilla to a medium bowl with a mesh strainer set on top.
3. Combine milk, remaining heavy cream, sugar and salt to a medium saucepan set over medium heat. Stir to dissolve sugar.
4. Whisk egg yolks in a small bowl.
5. When milk mixture begins to steam, slowly drizzle 1 cup warm liquid into the yolks, while continuously whisking. Pour egg mixture into sacuepan, followed by blueberry puree. Stir to combine. Continue cooking until mixture coats the back of a wooden spoon or rubber spatula.
6. Pour through mesh strainer into reserved heavy cream. Stir and cool over an ice bath to room temperature. Cover and chill thoroughly, 4-6 hours or overnight.
7. Churn according to manufacturer directions.
8. Transfer churned ice cream to a freezer safe container. Cover and freeze until solid.', 1, 2);


INSERT INTO recipes (title, image, prep_time, difficulty, serving, content, user_id, category_id) VALUES ('Peach Iced Tea', 'https://mbkr-minimalistbaker.netdna-ssl.com/wp-content/uploads/2014/06/Perfect-sweet-Peached-Iced-Tea-Perfect-for-summer-and-pool-days..jpg', 50, 'hard', 'serves 10', 'Ingredients
SIMPLE SYRUP
1 cup organic cane sugar
1 cup water
2 ripe peaches, thinly sliced + more for serving

TEA
2-3 Tbsp loose leaf black tea (3-4 tea bags), depending on how strong you prefer it
8 cups filtered water

Instructions
1. Bring sugar, water, and peaches to a boil in a small saucepan. Then lower heat and use a wooden spoon to stir and crush
the peaches to infuse the flavor.
2. Once the sugar is dissolved, cover, remove from heat and let steep for for 25-30 minutes.
3. In the meantime, brew your tea using either a large pot or a tea maker. I use this loose leaf tea steeper from IngenuiTEA.
NOTE: Use less tea if you prefer it weaker or more tea if you prefer it stronger, and try not to let it steep longer than 4-5
minutes or it can get bitter.
4. Once brewed, remove tea bags or strain out loose leaf tea and transfer to a pitcher. Refrigerate to cool.
5. Once your simple syrup is finished, pour into a bottle or container over a fine mesh strainer to strain out peaches. You can
reserve the peaches for later use, such as to place over oats or ice cream sundaes.
6. To serve, either set out simple syrup and add as much to the tea as you like, or add all of the simple syrup to the tea and
stir. I prefer leaving it separate. Serve tea over ice and fresh sliced peaches. Yields about 10 servings (with ice and
peaches).', 1, 3);

INSERT INTO recipes (title, image, prep_time, difficulty, serving, content, user_id, category_id) VALUES ('Frozen Mint Lemonade', 'https://i2.wp.com/www.anediblemosaic.com/wp-content/uploads//2013/10/Limonana-Middle-Eastern-Frozen-Mint-Lemonade-3.jpg?w=725', 8, 'easy', 'serves 2', 'Ingredients
6 tablespoons (115 g) sugar
½ cup (120 ml) plus 6 tablespoons (90 ml) water, divided
½ cup (120 ml) fresh lemon juice
4 stems worth of mint leaves (about 40 leaves, which is about 2 g) with the stems discarded, plus a few extra
sprigs for garnish if desired
18-20 ice cubes
1-2 drops orange blossom water (optional)
Instructions
1. Add the sugar and 6 tablespoons of water to a small saucepan; heat over medium heat, stirring constantly,
until the sugar is dissolved. Cool to room temperature.
2. Add the cooled sugar syrup, remaining ½ cup water, lemon juice, mint leaves, ice cubes, and orange blossom
water (if using) to a blender. Pulse a few times to break up the ice and then process until slushy.
3. Pour into 2 tall glasses, garnish with mint leaves if desired, and serve immediately.', 2, 3);
