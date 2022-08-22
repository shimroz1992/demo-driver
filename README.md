## Install

### Clone the repository

```bash
git clone https://github.com/shimroz1992/demo-driver.git
cd demo-driver
```

### Check your Ruby version

```bash
ruby -v
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby-3.1.2"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```bash
bundle && yarn
```

### Update database.yml file
In database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rails db:create db:migrate db:seed
```

### Serve

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000/api-docs/index.html
