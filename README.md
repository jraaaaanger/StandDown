![Build Status](https://codeship.com/projects/a67d3c40-2f3f-0134-5cab-5ebc8f268022/status?branch=master)
![Code Climate](https://codeclimate.com/github/jraaaaanger/StandDown.png)
[![Coverage Status](https://coveralls.io/repos/github/jraaaaanger/StandDown/badge.png?branch=master)](https://coveralls.io/github/jraaaaanger/StandDown?branch=master)

StandDown
=========

StandDown is a web app which allows users working on teams around the world to perform standup meetings asynchronously. Users are grouped into teams, each with its own location and timezone, and all teams belong to a global organization. The organization specifies questions for all teams to answer in their standup meetings--things like "what did you work on yesterday?"--and a set time for each standup meeting to begin.

For example, if a global organization has a start time of 9:00 AM, then users in Boston will be able to answer standup questions daily beginning at 9:00 EST. Users in San Francisco will see their questions at 9:00 PST, or 12:00 EST, users in Tokyo will see theirs at 9:00 JST, and so on.
Standup questions are only available if it's after the global start time in a user's time zone, and
if the user hasn't already answered all the questions for the day. As soon as the answers are entered, their responses go live asynchronously to all users within that organization. Other users can see answers grouped by team, as well as by organization as a whole, and users can be emailed quickly by clicking their name in case communication is necessary.
