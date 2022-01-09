# SlackWeb

This module allows you to automate your Slack tasks (at least some!) w/o the need to register an application in your Slack workspace. All what you need is a regular user account. No need for an approval from your space administrator.

It is possible by utilizing the Slack Web API - the API which the web-client uses. To execute methods of that API you need two pieces of authentication material: your user token (starts with "xoxc-") and one of your cookies (a so called "d-cookie").

DISCLAMER: the API-calls are reverse-engineered - the module may stop working any moment. Please use at your own risk.

## How to start

1. `Install-Module SlackWeb`
1. Find your web-token and the d-cookie:
   1. Open Developer tools in your preferred web-browser.
   1. Open your Slack team in that web-browser.
   1. In "Developer tools" on the "Network" tab look for a request starting with client.boot
      ![image](https://user-images.githubusercontent.com/17012873/148698907-cdc251ef-b0b5-4081-873d-49bfccf7fa04.png)
   1. Click the request, go to the "Payload" tab, copy the value of the "token" parameter:
      ![image](https://user-images.githubusercontent.com/17012873/148699051-cd9839e5-cc4e-4e75-b323-a7fd201f8fb3.png)
   1. Switch to the "Headers" tab and copy the value of the "d" cookie from there:
      ![image](https://user-images.githubusercontent.com/17012873/148699188-0910932d-d2b4-490b-8e19-2d754a1b3eee.png)
1. Import the module. It will ask you for values for the token and the cookie. If you want to change them later, use `Set-SlackWebConfiguration`.

## What options are available now

Currently the module allows you to:
+ get/search for a channel (`Get-Channel`),
+ get/export history from channels, direct messages, group messages (`Get-ChannelMessages`, `Get-MessageReplies`, `Export-ChannelHistory`);
+ get/export accounts from your workspace and all workspaces connected to it (`Get-People`, `Export-People`).

Please suggest what features you would like to see next by creating issues in this repo.
