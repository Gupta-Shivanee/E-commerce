Application name:- E-Commmerce Website

Heroku link:- https://vast-atoll-85851.herokuapp.com/

##### Prerequisites

The setups steps expect following tools installed on the system.

 Github
 Ruby [3.0.0]
 Rails [6.1.3]
 postgresql [12.6]

##### 1. Check out the repository

```bash
git clone git@github.com:Gupta-Shivanee/E-commerce.git
```

##### 2. Install Dependecies

Using Bundler and Yarn:

```bash
bundle && yarn
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

##### 5. Deploy on heroku

```bash
git push heroku master
```
