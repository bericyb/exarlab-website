---
title: "Publish an Expo React Native App to the App Store"
date: 2022-09-27T04:25:50Z
draft: false
summary: "The process of getting your app on the Apple app store."
---

# assumptions

This guide assumes that you are using React Native with Expo. 
React Native is a flavor of the frontend web framework React that 
allows you to write mobile code in Javascript for both Android, iOS
and even the web all at once. Expo is a platform for React Native 
development with plenty of developer friendly tooling. 

Expo comes with a CLI app that installs through npm. The platform 
also provides many useful packages like local storage and even push
notification services to use in your app.

# forewarning

Getting on the app store is a long and painful process. I'm sorry,
but this is the way that Steve Jobs wanted it. Here's some of the 
things you have to do. Steps 1 and 3 are only for accounts that are not sole proprietors.

1. Form an LLC
2. Pay the $99 *YEARLY* Apple Developer fee
3. Acquire a D.U.N.S number (You can do this through Apple)

Only after you've done these will you be enrolled in the Apple Developer Program. 

# app.json

First, you may need to adjust your app.json file 
in the root of your project. 
Be sure to adjust the name and the slug of your
project. 

Here's an example with my app.json.

```
{
  "expo": {
    "name": <YOUR APP NAME>,
    "slug": <SOMESLUG>,
    "version": "2.0.1",
    "privacy": "unlisted",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "light",
    "splash": {
      "image": "./assets/splash.png",
      "resizeMode": "contain",
      "backgroundColor": "#ffffff"
    },
    ...
}
```

# expo services

Next if you haven't already, you should install 
eas-cli. EAS is Expo Application Services. This 
will help you build, submit, and update your app
and will be the primary way you interact with
Apple's App Store Connect. 

Install it with 
``` npm install -g eas-cli ```

After installing you must log in to your Expo 
account.

```eas login```

Provide your Expo credentials. 

You can check if you are properly logged in with
```eas whoami```

# configure project

Expo does some special magic to turn your 
javascript code into natively executable code on 
a phone. In order to do this, we need to 
configure your project. 

Run 

```eas build:configure```

and select iOS.

You should now see a eas.json file in the root 
of your project directory. We'll add some information to this later. 

# build project

Building should be simple now. 

Run 

```eas build --platform ios```

You will be asked for a bundle identifier.
It is a unique string used to identify your
app. 
Something like
`com.your.app.name` 
works just fine.

Next you will be asked to log into your Apple
developer account. Please do this. It will 
automate the process greatly. 

Following that, you will be asked if you would
like to generate a Apple Distribution 
Certificate.
This certificate just states that the application
was built on a certain computer, (your computer)
and has not been tampered with. 
Say yes. 

Same for Apple provisioning profile. Say yes. 

Your may be asked for more or less things. Push
notifications etc.
I would say yes to most of these things except in
special cases. 

Eventually your terminal will show you that 
your build is queued up, or is building. 
Just be patient. This might take a awhile. 5 hours 
for me the last time I tried. 

If you want to check on the progress, you can by clicking
the link shown. 

# prepare app store connect

On your browser, sign into your Apple developer account and find your 
way to App Store Connect. 

Select My Apps and add an iOS app.
Enter all the appropriate information that is needed. 
Go ahead and make a SKU however you'd like to. 

You should now have a blank page for your app.

In order to be considered for review, you must provide screenshots
of your app working, a test user's sign-in credentials, age ratings, etc.

Fill out as much information as you can on the App Information, Pricing and Availability, 
App Privacy tabs. 

For App Privacy, you will need to create a privacy policy even if you 
don't collect any user data. If you want to do this quickly you can use
[PrivacyPolicies.com](https://app.privacypolicies.com/wizard/privacy-policy)
It costs about $62, but is immediately available. 

For Screenshots you will need to use screenshots that are the dimensions of
the iPhone 11 Max and the iPhone 8 Max screens. Just load your app in the
Simulator with these phones and take 3 screenshots. 

Now all that's left is submitting/uploading your build.

# submit/upload your build

This is where some terminology will get quite confusing. So follow along 
close!

In this step we will submit your build to Apple 
App Store Connect, but this is *NOT* the final App Store
submission. It is merely just sending your built code
to Apple. 

Before we can send our build, we need to change some things in eas.json.

In the submit.production.ios object you will need to add.
1. appleId (Your apple id email)
2. ascAppId (Found in App Store Connect under the App Information tab as Apple ID)
3. appleTeamId (Found in the Apple Developer Dashboard under the Membership as Team ID tab)

```
{
  ...
  "submit": {
    "production": {
      "ios": {
        "appleId": "<YOUR APPLE ID EMAIL>",
        "ascAppId": "<APPLE APP ID>",
        "appleTeamId": "<APPLE DEVELOPER TEAM ID>"
      }
    }
  }
  ...
}
```

You can send the latest build of your code to Apple using the EAS cli

run 
```eas submit --platform ios --latest```

Choose to add a new ASC API key and log in to your Apple Account. 
After a few minutes your build should have been submitted to Apple. 

Check your App Store Connect TestFlight page if the build is there under the TestFlight tab. It may take
a few more minutes for it to show up. 

Under status, you will be told the build is missing compliance. *~DON'T WORRY~*
Hit manage and select No if you aren't using encryption. (You probably aren't)

# internal testing on testflight

You are ready to start internal testing!

Internal testing is just testing the app build on TestFlight, but only for 
members of your Apple Developer Team.

Hit the plus button on the Internal Testing tab to create a new group and
send email invites to users that are within your Apple Developer Team. 

# external testing on testflight

To get external testing started your build must pass some review by Apple. The review
process automatically starts after you create an external testing group. 

This takes about 24-48 hours to complete. Under external testing, your build should
have a status "waiting for review". Just be patient.

In the meantime, you can tentatively add your beta testers' emails to the group with their
names. Once the review passes, they will be automatically invited to download the app 
through testflight. 


# app store release

Once again we are on the App Store Connect App Store page. Under the build section, 
select the build that you previously uploaded. Save the information and submit for review. 

Good luck! You will most likely get some push back from Apple. Try your best to answer any of the questions 
they have. 


Let me know if you have any questions about this article or if anything was unclear at `bericb@gmail.com`





