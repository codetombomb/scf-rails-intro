## Phase 4 Overview

- Create RESTful APIs
- Validate data
- Share data between a frontend JavaScript application and a backend API application
- Build authentication into APIs
- Deploy

## Goals for today

- [x]  Review MVC
- [x]  Use Rails generators
- [ ]  Explain what status codes are and why we use them
- [ ]  Observe how to use rails generators to accomplish certain tasks
- [ ]  Observe how to create migration files and migrate using rails generators
- [ ]  Observe how to seed a database
- [ ]  Observe how to call Class methods in controller actions
- [ ]  Observe how to structure a json response
- [ ]  Observe how to return status codes

## Review MVC

MVC can be described as an architectural pattern that is composed of three main parts:

- Model
- View
- Controller

![Screen Shot 2022-10-27 at 12.55.28 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7ff8c11b-f288-4aff-b66c-87f8c4a3bc9a/Screen_Shot_2022-10-27_at_12.55.28_PM.png)

- [The MVC Architecture](https://towardsdatascience.com/everything-you-need-to-know-about-mvc-architecture-3c827930b4c1)
    - **Model**
        
        Controls what the data looks like. Responsible for creating and “shaping” our data.
        
        The model is also where we will:
        
        - Validate data
        - Customize it (through the use of methods)
    - **View**
        
        The presentation - this is going to be our React front end
        
    - **Controller**
        
        Responsible for transporting data to our views. The controllers are the “middle person” between the Model and the View. 
        

## [Using Rails Generators](https://guides.rubyonrails.org/command_line.html#bin-rails-generate)

In our Sinatra apps, we prefixed a lot of the commands that we were using with `rake`. A lot of those commands still work here in Rails but you will be prefixing the commands with `rails` instead. 

### Creating a new Rails application

- New app **with** views (we will not be using Rails’ built in views)
    
    ```bash
    
    rails new name_of_app
    ```
    
    - This will generate a full rails app with views.
    - Generate and scaffold a new Rails app
        
        ```bash
        rails new books-example
        ```
        
        ```bash
        rails g scaffold books title:string author:string publication_year:integer
        ```
        
        ```bash
        rails db:migrate
        ```
        
    
- New app **without** views
    
    ```bash
    
    rails new name_of_app --api --minimal -T
    ```
    
    - **—api**: This will generate a Rails api only
    - **—minimal:** This will tell the Rails generator to create an app with the most basic set up and not include files that we will not need.
    - **-T:** This will allow us to use Rails generators after creation without having to specify `--no-test-framework`
        - Generate a new Rails API
            
            ```bash
            rails new books-example --api --minimal -T
            ```
            
            ```bash
            rails db:migrate
            ```
            
    
- Must know Rails generators
    
    All generators will start with `rails generate` or `rails g` for short
    
    - `rails g` - prints out a list of all available generators
        
        ![Screen Shot 2022-10-27 at 3.20.00 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f04c2963-dfa9-45cd-903d-e2531dfafb2d/Screen_Shot_2022-10-27_at_3.20.00_PM.png)
        
    - `rails g migration` - Creates just the migration.
        
        ![Screen Shot 2022-10-27 at 3.23.07 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/79516142-5785-4210-a1f8-b3848f716619/Screen_Shot_2022-10-27_at_3.23.07_PM.png)
        
        ![Screen Shot 2022-10-27 at 3.29.02 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e7e64217-e00e-4272-a1a6-6b13e4f7b696/Screen_Shot_2022-10-27_at_3.29.02_PM.png)
        
        `rails d migration [name_of_migration_to_undo]` - undo a migration
        
    - `rails g model` - Creates both the model and the migration.
        
        ![Screen Shot 2022-10-27 at 3.24.21 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fc4198f5-c61f-4b71-88d0-435833d0e048/Screen_Shot_2022-10-27_at_3.24.21_PM.png)
        
        ![Screen Shot 2022-10-27 at 3.29.50 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ba11c0ca-b492-4651-b276-718bf612ccbc/Screen_Shot_2022-10-27_at_3.29.50_PM.png)
        
    - `rails g controller` - Creates a controller file and a set of routes. This will also create a view directory and view templates for each action in the non-api version.
        
        ![Screen Shot 2022-10-27 at 3.27.20 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/99280717-035f-4446-bf4b-eec04a8689f5/Screen_Shot_2022-10-27_at_3.27.20_PM.png)
        
        ![Screen Shot 2022-10-27 at 3.30.34 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ff5e7a55-a27a-4474-8eec-0d23ff4a4549/Screen_Shot_2022-10-27_at_3.30.34_PM.png)
        
    
    ---
    
    Other commands:
    
    - `rails g resource` - Creates a model, controller, migration and routes
    - `rails g scaffold` - Generates a fully functional app
    - `rails g serializer` - Generates a serializer

## The Important Parts

There are a lot of files here but I want to hone in on the parts that you will be using most:

- app
    - app/controllers
    - app/models
- config
    - routes.rb
- db
    - db/migrate
    - db/seeds.rb
- Gemfile

## Creating an API

Repo link: https://github.com/codetombomb/scf-rails-intro

![Screen Shot 2022-10-27 at 4.18.01 PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/65593561-4f8f-45cc-a545-1c4906360cc2/Screen_Shot_2022-10-27_at_4.18.01_PM.png)

- [x]  Create a books model and migration
- [x]  Create seeds
- [x]  Create routes for index action
- [x]  Create index action
- [x]  Return successful status code in action
- [ ]  Return unsuccessful status code
- [x]  Create show
- [x]  Create update
- [x]  Create delete

### Resources

Http status codes: [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)

Rails generator cheat sheet: [https://medium.com/@isphinxs/a-cheat-sheet-for-rails-generators-44cf79884ac7](https://medium.com/@isphinxs/a-cheat-sheet-for-rails-generators-44cf79884ac7)

Scaffolding in Rails: [https://www.rubyguides.com/2020/03/rails-scaffolding/](https://www.rubyguides.com/2020/03/rails-scaffolding/)