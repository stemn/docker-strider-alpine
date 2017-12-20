# Alpine - Strider Docker
Strider Container for dockering the CI framework

## Adding a User to Strider
Adding a User
```strider addUser -l example@stemn.com -p password -a true -f true```

Parameters:
  -a Admin true/false
  -f Force Creation true/false
  -l Email
  -p Password

## Starting Strider
Set the the DB_URI variable in the command line before starting
E.G
DB_URI=mongodb://mongoUser:mongoPassword@mongoAddress/mongoDatabase

Then run with `strider` or with whatever 

### Credits

  * [Strider](https://github.com/Strider-CD/strider) - Strider 
  * [Strider-Docker](https://github.com/Strider-CD/docker-strider) - Original Strider Dockerfile for Ubuntu
  * [Strider-CLI](https://github.com/Strider-CD/strider-cli) - Strider CLI interface for adding users etc...
  * [Strider Docs](http://strider-cd.github.io/) - Strider Documentation