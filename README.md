# <u>BragBook</u>

## <u>About</u>
BragBook is a site that allows people to connect with friends and share what going on in their lives. they can do this through creating posts, uploading pictures and adding multiple friends. BragBook also allows users to comment on their friends post and respond via likes and various emoji's.

## View project on Heroku:
[BragBook](https://bragbook.herokuapp.com/users/sign_in)

## <u>Setup:</u>
1. Fork this repository `acebook-SassBook` and customize
the below**

2. Clone the repository and follow below:

```bash
      > bundle install
      > bin/rails db:create
      > bin/rails db:migrate

      > bundle exec rspec # Run the tests to ensure it works
      > bin/rails server # Start the server at localhost:3000
```

## How to contribute to this project
[CONTRIBUTING.md](CONTRIBUTING.md)


### <u>User Stories</u>
```
As a Bragger
So that I can show off about my life
I want to be able to sign up for BragBook

As a Bragger
So that I can show continue showing off my life
I want to be able to log into BragBook

As a Bragger
So that I can let people know what I am doing  
I want to be able to post on my profile

As a Bragger
So that I can keep track of my exciting life
I want to see my posts in reverse-chronological order

As a Bragger
So that I can rewrite history
I want to be able to delete posts on my page

As a Bragger
So that I can find the person I am looking for
I want to be able to scan through all bragbook users

As a Bragger
So that I can keep tabs on my “friends”
I want to be able to add friends to my friends list

As a Bragger
So that I can keep tabs on my “friends”
I want to be able to view my friends’ profiles.

As Makers
So that we show off our wonderful social media site
We want to deploy our project to Heroku

As a Bragger
So people can see more of my beautiful face
I want to be able upload a display a picture for my profile

As a Bragger
So that I can let my friends know I care about their interests
I can comment on their posts

As a Bragger
So that I can let my friends know I really care about their interests
I can like their posts and other comments
```

### <u>Planning:</u>
#### User Flowchart:
![User Flowchart](app/assets/images/User_Flowchart.png)
#### Class Diagram
![Entity Relationship Diagram](app/assets/images/Diagrams.png)
#### StoryBoard:
![Slide3](app/assets/images/StoryBoard1.png)
![Slide1](app/assets/images/StoryBoard2.png)
![Slide1](app/assets/images/StoryBoard3.png)
![Slide1](app/assets/images/StoryBoard4.png)



### <u>Features:</u>
- ✅ Sign-up and Login, details saved
- ✅ Displays posts history
- ✅ CRUD posts
- ✅ Search toolbar
- ✅ Adding Braggers
- ✅ Viewing Braggers Profiles
- ✅ Commenting Function
- ✅ Display pictures
- ✅ Liking posts
- ❌ Instant Messaging
