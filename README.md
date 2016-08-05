![Build Status](https://codeship.com/projects/a67d3c40-2f3f-0134-5cab-5ebc8f268022/status?branch=master)
![Code Climate](https://codeclimate.com/github/jraaaaanger/StandDown.png)
[![Coverage Status](https://coveralls.io/repos/github/jraaaaanger/StandDown/badge.png?branch=master)](https://coveralls.io/github/jraaaaanger/StandDown?branch=master)

StandDown
=========

StandDown is a web app which allows users working on teams around the world to perform standup meetings asynchronously. Users are grouped into teams, each with its own location and timezone, and all teams belong to a global organization. The organization specifies questions for all teams to answer in their standup meetings--things like "what did you work on yesterday?"--and a set time for each standup meeting to begin.

For example, if a global organization has a start time of 9:00 AM, then users in Boston will be able to answer standup questions daily beginning at 9:00 EST. Users in San Francisco will see their questions at 9:00 PST, or 12:00 EST, users in Tokyo will see theirs at 9:00 JST, and so on.
Standup questions are only available if it's after the global start time in a user's time zone, and
if the user hasn't already answered all the questions for the day. As soon as the answers are entered, their responses go live asynchronously to all users within that organization. Other users can see answers grouped by team, as well as by organization as a whole, and users can be emailed quickly by clicking their name in case communication is necessary.

## Getting Started

To begin, users must sign up using an existing team in the system. Once logged in, users are brought to the standup home, which will display that day's standup questions in the bottom left only if it is after the global standup time in the local zone, and if the user hasn't yet answered the questions for the day. The right side displays a live feed for all recent updates across the organization.

Clicking on the organization name in the navigation bar directs to a page with live feeds for all teams in the organization. Users can select 'All Teams' to see all answers for the organization as they come in, or return to 'Answers by Team' to see live-updating answers separated by team and timezone.

Clicking 'All Teams in' the current organization will take the user to a list of teams, each displaying the time difference. Selecting one will take the user to the team page, where users can see the timezone, the local time and time difference, as well as a live feed of all recent responses and a list of local users.

## Sample Login

If you'd like to play with StandDown without creating an account, please login with the email __test@test.com__ and the password _test1234_. This will give you access to a team based in Boston, MA which is connected to teams in Reykjavik, Iceland, Redmond, WA, and Tbilisi, Georgia.

## Future Updates

Going forward, there are several features which have yet to be added to organizations. Changing global start time and standup questions will both be added in the coming weeks. In addition, I would like to add the possibility of entirely remote teams, where each user has a specific timezone and can participate independently within their remote team.

Long-term, I'd like to play around with Google Translate API functionality by adding _language_ as a team attribute. Through this, I hope to add live translations to user responses so that non-English-speaking members in different countries can seamlessly participate in standups without third-party translation.
