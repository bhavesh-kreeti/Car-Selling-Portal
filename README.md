## This is a car selling website where user can get the quotation of their car

### Run rails db:migrate
### rails db:seed (as registration year data and user role are in seed file)


### First sign up as admin and create all the required feild by clicking on admin pannel and 

### create car cost provide all the four details : fair, good, very good, excellent

### At first user need to login or signup 
 #### For signup
  >They need to give their email id, password and role like Admin, Buyer, Seller
  >Then they will receive conformation mail and they need to confirm it to login
#### After login there will be option to buy or sell

##### To sell car and get quotation
>First need to give their car details and submit the form.
>Then they will be asked to give their phone no to generate a token id
>The token id generated will be valid to only that specified user.

##### There is My account option in navbar
  * Edit
  > User can edit their credentials like email id or phone no. If user had not generated any token then cannot update their phone no
  
  * My appointment
  > Here user can check all the appointment they have generated along with their appointment id and status
  * Branch
  > Here user can create their branch just by typing the place name. The coordinates corresponding to that place will be           automatically be generated
  * Search bar
  > Here user can paste their Token id and get the status of their add and if user entered token id of other user then they         will get an unauthorize message and an invalid message if the token id is invalid
  
 ##### Buy Section
 > User can see all the post adds and also filter the adds according to their category
 
 ### ADMIN SECTION
 * There is a admin tab in nav bar which is redirected to the page where admin can perform ## CRUD ## operation
 * There is a update status tab where admin can updated the status of user add and user will get a email confirmation
 
